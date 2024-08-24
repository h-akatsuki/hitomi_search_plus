import 'dart:async';
import 'dart:collection';

import 'package:hitomi_search_plus/db/image.dart';
import 'package:hitomi_search_plus/db/tasks.dart';
import 'package:hitomi_search_plus/download/download.dart';
import 'package:hitomi_search_plus/hitomi/gallery.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gallery.g.dart';

abstract class ImageDownloadStatus {
  @override
  bool operator ==(Object other) {
    return other is ImageDownloadStatus && runtimeType == other.runtimeType;
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImageDownloadLoadingStatus extends ImageDownloadStatus {}

class ImageDownloadNotStarted extends ImageDownloadStatus {}

class ImageDownloadDone extends ImageDownloadStatus {}

class ImageDownloadError extends ImageDownloadStatus {
  final String message;
  ImageDownloadError(this.message);

  @override
  bool operator ==(Object other) {
    return super == other &&
        other is ImageDownloadError &&
        message == other.message;
  }

  @override
  int get hashCode => Object.hash(super.hashCode, message);
}

class ImageDownloadDownloading extends ImageDownloadStatus {
  final int streamId;
  ImageDownloadDownloading(this.streamId);

  Stream<double> get stream => workersProgressStreamList[streamId].stream;

  @override
  bool operator ==(Object other) {
    return super == other &&
        other is ImageDownloadDownloading &&
        streamId == other.streamId;
  }

  @override
  int get hashCode => Object.hash(super.hashCode, streamId);
}

class UpdateCounter {
  final int count;
  final ImageDownloadStatus Function(int) getStatus;

  UpdateCounter(this.count, this.getStatus);

  @override
  bool operator ==(Object other) {
    return other is UpdateCounter &&
        count == other.count &&
        getStatus == other.getStatus;
  }

  @override
  int get hashCode => count.hashCode;

  UpdateCounter increment() {
    return UpdateCounter(count + 1, getStatus);
  }
}

@riverpod
class GalleryDownloadStatus extends _$GalleryDownloadStatus {
  HashMap<int, String> error = HashMap();
  Set<int> tasks = {};
  KeepAliveLink? link;

  @override
  Future<UpdateCounter> build(int id) async {
    int? total = await getTotal(id);
    if (total == null) {
      final gallery = await ref.read(galleryJSProvider(id).future);
      total = gallery.files.length;
    }
    for (int i = 0; i < total; i++) {
      tasks.add(i);
    }
    for (var key in workersKeyList) {
      if (key?.id == id) {
        tasks.remove(key!.page);
      }
    }
    final pages = await getImages(id);
    for (var page in pages) {
      tasks.remove(page);
    }
    final listen = updateStrem.stream.listen((update) => updateState(update));
    ref.onDispose(() {
      listen.cancel();
    });
    return UpdateCounter(total, getStatus);
  }

  void updateState(Update update) {
    if (state.value != null) {
      if (update.key.id == id) {
        if (update.type == UpdateType.error) {
          error[update.key.page] = update.message ?? 'Unknown error';
        } else if (update.type == UpdateType.start) {
          tasks.remove(update.key.page);
        }
        state = AsyncValue.data(state.value!.increment());
      }
    }
  }

  ImageDownloadStatus getStatus(int page) {
    if (state.value == null) {
      return ImageDownloadLoadingStatus();
    }
    for (int i = 0; i < workerCount; i++) {
      if (workersKeyList[i]?.id == id && workersKeyList[i]?.page == page) {
        return ImageDownloadDownloading(i);
      }
    }
    if (error.containsKey(page)) {
      return ImageDownloadError(error[page]!);
    } else if (tasks.contains(page)) {
      return ImageDownloadNotStarted();
    } else {
      return ImageDownloadDone();
    }
  }
}

@riverpod
ImageDownloadStatus imageDownloadStatus(
    ImageDownloadStatusRef ref, ImageKey key) {
  final status = ref.watch(
      galleryDownloadStatusProvider(key.id).select((value) => switch (value) {
            AsyncData(:final value) => value.getStatus(key.page),
            _ => ImageDownloadLoadingStatus(),
          }));
  return status;
}
