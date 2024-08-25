import 'dart:async';
import 'dart:typed_data';

import 'package:hitomi_search_plus/db/export.dart';
import 'package:hitomi_search_plus/db/tasks.dart';
import 'package:hitomi_search_plus/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'like.g.dart';

Future<void> initLike(Database db) async {
  await db.execute('''
    CREATE TABLE IF NOT EXISTS like (
      id INTEGER PRIMARY KEY,
      added_at INTEGER,
      done INTEGER
    )
  ''');
}

class LikeItem {
  final int id;
  final int galleryId;
  final int addedAt;
  final bool done;

  LikeItem({
    required this.id,
    required this.galleryId,
    required this.addedAt,
    required this.done,
  });
}

Future<void> like(int galleryId, {bool done = false}) async {
  await db.rawInsert('''
    INSERT OR REPLACE INTO like (id, added_at, done)
    VALUES (?, ?, ?)
  ''', [galleryId, DateTime.now().millisecondsSinceEpoch, done ? 1 : 0]);
}

Future<void> unlike(int galleryId) {
  return db.rawDelete('''
    DELETE FROM like WHERE id = ?
  ''', [galleryId]);
}

Future<void> done(int galleryId) {
  return db.rawUpdate('''
    UPDATE like SET done = 1 WHERE id = ?
  ''', [galleryId]);
}

Future<bool> isLiked(int galleryId) async {
  final count = await db.rawQuery('''
    SELECT COUNT(*) FROM like WHERE id = ?
  ''', [galleryId]);
  return count.first.values.first as int > 0;
}

class LikeUpdate {
  final bool value;
  final int galleryId;
  final bool? done;

  LikeUpdate({
    required this.value,
    required this.galleryId,
    this.done,
  });
}

final likeStream = StreamController<LikeUpdate>.broadcast();

@riverpod
class Like extends _$Like {
  @override
  bool build(int galleryId) {
    ref.watch(dataSyncProvider);
    Future(() {
      load();
    });
    return false;
  }

  Future<void> load() async {
    state = await isLiked(galleryId);
  }

  Future<void> toggle() async {
    state = !state;
    if (!state) {
      await unlike(galleryId);
      likeStream.add(LikeUpdate(value: false, galleryId: galleryId));
    } else {
      final isDone = await taskIsDone(galleryId);
      await like(galleryId, done: isDone);
      likeStream
          .add(LikeUpdate(value: true, galleryId: galleryId, done: isDone));
    }
  }
}

@riverpod
class LikeList extends _$LikeList {
  @override
  Future<Uint32List> build() async {
    ref.watch(dataSyncProvider);
    final result = await db.rawQuery('''
      SELECT id FROM like ORDER BY added_at ASC
    ''');
    final listen = likeStream.stream.listen(updateState);
    ref.onDispose(() {
      listen.cancel();
    });
    return Uint32List.fromList(result.map((e) => e['id'] as int).toList());
  }

  void updateState(LikeUpdate update) {
    if (state.value == null) {
      return;
    }
    final value = state.value!;
    final Uint32List newState;
    if (update.value) {
      newState = Uint32List(value.length + 1);
      newState.setAll(0, value);
      newState[value.length] = update.galleryId;
    } else {
      newState = Uint32List(value.length - 1);
      var index = 0;
      for (var i = 0; i < value.length; i++) {
        if (value[i] == update.galleryId) {
          continue;
        }
        newState[index] = value[i];
        index++;
      }
    }
    state = AsyncValue.data(newState);
  }
}

Future<List<int>> getUnDoneList() async {
  final result = await db.rawQuery('''
    SELECT id FROM like WHERE done = 0
  ''');
  return result.map((e) => e['id'] as int).toList();
}
