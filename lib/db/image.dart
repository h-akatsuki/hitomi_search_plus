import 'dart:async';
import 'dart:typed_data';

import 'package:hitomi_search_plus/db/like.dart';
import 'package:hitomi_search_plus/db/tasks.dart' as tasks;
import 'package:hitomi_search_plus/db/tasks.dart';
import 'package:hitomi_search_plus/download/download.dart';
import 'package:hitomi_search_plus/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'image.g.dart';

Future<void> initImage(Database db) async {
  await db.execute('''
    CREATE TABLE IF NOT EXISTS image (
      id INTEGER,
      page INTEGER,
      name TEXT,
      width INTEGER,
      height INTEGER,
      data BLOB,
      PRIMARY KEY (id, page)
    )
  ''');
}

Future<void> setImage(int id, int page, int total, String name, int width,
    int height, Uint8List data) async {
  await db.rawInsert('''
    INSERT OR REPLACE INTO image (id, page, name, width, height, data)
    VALUES (?, ?, ?, ?, ?, ?)
  ''', [id, page, name, width, height, data]);
  final imagesCount = await db.rawQuery('''
    SELECT COUNT(*) FROM image WHERE id = ?
  ''', [id]);
  final count = imagesCount.first.values.first as int;
  if (count == total) {
    done(id);
  }
  await upsrtTask(tasks.Task(id: id, total: total, done: count));
}

Future<void> deleteImage(ImageKey key) {
  return db.rawDelete('''
    DELETE FROM image WHERE id = ? AND page = ?
  ''', [key.id, key.page]);
}

Future<void> deleteImages(int id) {
  return db.rawDelete('''
    DELETE FROM image WHERE id = ?
  ''', [id]);
}

class ImageItem {
  final String name;
  final int width;
  final int height;
  final Uint8List data;

  ImageItem({
    required this.name,
    required this.width,
    required this.height,
    required this.data,
  });
}

Future<ImageItem?> getImage(ImageKey key) async {
  final result = await db.rawQuery('''
    SELECT name, width, height, data FROM image WHERE id = ? AND page = ?
  ''', [key.id, key.page]);
  if (result.isEmpty) {
    return null;
  }
  final map = result.first;
  return ImageItem(
    name: map['name'] as String,
    width: map['width'] as int,
    height: map['height'] as int,
    data: map['data'] as Uint8List,
  );
}

Future<bool> hasImage(ImageKey key) async {
  final result = await db.rawQuery('''
    SELECT COUNT(*) FROM image WHERE id = ? AND page = ?
  ''', [key.id, key.page]);
  return result.first.values.first as int > 0;
}

Future<List<int>> getImages(int id) async {
  final result = await db.rawQuery('''
    SELECT page FROM image WHERE id = ?
  ''', [id]);
  return result.map((e) => e['page'] as int).toList();
}

@riverpod
class GalleryImages extends _$GalleryImages {
  @override
  Future<Set<int>> build(int id) async {
    final result = await db.rawQuery('''
      SELECT page FROM image WHERE id = ?
    ''', [id]);
    final subscription =
        updateStrem.stream.listen((update) => updatePages(update));
    ref.onDispose(() => subscription.cancel());
    return result.map((e) => e['page'] as int).toSet();
  }

  void updatePages(Update update) {
    if (update.key.id == id) {
      if (update.type == UpdateType.done) {
        state = AsyncValue.data(state.value!..add(update.key.page));
      }
    }
  }
}
