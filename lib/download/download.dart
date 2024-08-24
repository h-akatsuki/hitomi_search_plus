import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hitomi_search_plus/db/image.dart';
import 'package:hitomi_search_plus/hitomi/common.dart';
import 'package:hitomi_search_plus/hitomi/gallery.dart';
import 'package:hitomi_search_plus/hitomi/gg.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'download.freezed.dart';
part 'download.g.dart';

class Signal {
  Completer<void> _completer;
  Future<void> _wait;

  Signal._(this._completer, this._wait);

  static Signal create() {
    final completer = Completer<void>();
    final wait = completer.future;
    return Signal._(completer, wait);
  }

  void complete() {
    if (!_completer.isCompleted) {
      _completer.complete();
    }
    _completer = Completer<void>();
    _wait = _completer.future;
  }

  Future<void> waitNext() => _wait;

  bool get isCompleted => _completer.isCompleted;
}

final downloadSignal = Signal.create();

class Task {
  final int id;
  final int total;
  final int page;
  final File file;
  Task({
    required this.id,
    required this.total,
    required this.page,
    required this.file,
  });
}

enum UpdateType {
  start,
  done,
  error,
}

class Update {
  final ImageKey key;
  final int total;
  final int workerId;
  final UpdateType type;
  final String? message;

  Update({
    required this.key,
    required this.total,
    required this.workerId,
    required this.type,
    this.message,
  });
}

@freezed
class ImageKey with _$ImageKey {
  factory ImageKey({
    required int id,
    required int page,
  }) = _ImageKey;
}

final updateStrem = StreamController<Update>.broadcast();
final progressStream = HashMap<ImageKey, StreamController<double>>();
final workersKey = <ImageKey>[];

abstract class TaskGenerator {
  Task? generateTask();
  int get priority;
}

final tasks = List<TaskGenerator>.empty(growable: true);

void addTask(TaskGenerator task) {
  tasks.add(task);
  tasks.sort((a, b) => b.priority.compareTo(a.priority));
}

void removeTask(TaskGenerator task) {
  tasks.remove(task);
}

Signal taskLock = Signal.create();
bool executing = false;
const executionDelay = Duration(milliseconds: 100);
Future<Task?> nextTask() async {
  while (executing) {
    await taskLock.waitNext();
  }
  executing = true;
  try {
    for (int i = 0; i < tasks.length; i++) {
      final task = tasks[i];
      final result = task.generateTask();
      if (result != null) {
        return result;
      }
    }
    return null;
  } finally {
    Future.delayed(executionDelay, () {
      executing = false;
      taskLock.complete();
    });
  }
}

const workerCount = 6;
final workersKeyList = List<ImageKey?>.filled(workerCount, null);
final workersProgressStreamList = List<StreamController<double>>.generate(
  workerCount,
  (index) => StreamController<double>.broadcast(),
);

@Riverpod(keepAlive: true)
class DwonloadWorkers extends _$DwonloadWorkers {
  @override
  int build() {
    Future(() {
      for (var i = 0; i < workerCount; i++) {
        worker(i);
      }
    });
    return 0;
  }

  void worker(int index) async {
    while (true) {
      final task = await nextTask();
      if (task == null) {
        await downloadSignal.waitNext();
        continue;
      }
      state = state + 1;
      workersKeyList[index] = ImageKey(id: task.id, page: task.page);
      await execute(task, index);
      workersKeyList[index] = null;
      state = state - 1;
    }
  }

  Future<void> execute(Task task, int index) async {
    updateStrem.add(Update(
      key: ImageKey(id: task.id, page: task.page),
      total: task.total,
      workerId: index,
      type: UpdateType.start,
    ));
    final stream = workersProgressStreamList[index];
    final client = http.Client();
    try {
      stream.add(0.0);
      final gg = await ref.read(gGProvider.future);
      final url = gg.imgUrl(task.file, ImgType.webp);
      final request = http.Request('GET', Uri.parse(url))
        ..headers['referer'] =
            "https://hitomi.la/reader/${task.id}.html#${task.page + 1}";
      final resp = await client.send(request);

      final total = int.parse(resp.headers['content-length'] ?? '0');
      if (total == 0) {
        throw Exception('Content length is missing or zero');
      }

      final data = Uint8List(total);
      var received = 0;

      await for (final chunk in resp.stream) {
        data.setAll(received, chunk);
        received += chunk.length;
        stream.add(received / total);
      }

      if (received != total) {
        throw Exception('Received data size does not match content length');
      }

      stream.add(1.0);

      await setImage(
        task.id,
        task.page,
        task.total,
        task.file.name,
        task.file.width,
        task.file.height,
        data,
      );
      updateStrem.add(Update(
        key: ImageKey(id: task.id, page: task.page),
        total: task.total,
        workerId: index,
        type: UpdateType.done,
      ));
    } catch (e) {
      updateStrem.add(Update(
        key: ImageKey(id: task.id, page: task.page),
        total: task.total,
        workerId: index,
        type: UpdateType.error,
        message: e.toString(),
      ));
    } finally {
      client.close();
    }
  }
}
