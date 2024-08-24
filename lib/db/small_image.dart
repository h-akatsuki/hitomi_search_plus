import 'dart:typed_data';

import 'package:hitomi_search_plus/hitomi/common.dart';
import 'package:hitomi_search_plus/hitomi/gallery.dart';
import 'package:hitomi_search_plus/hitomi/gg.dart';
import 'package:hitomi_search_plus/main.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'small_image.g.dart';

Future<void> initSmallImage(Database db) async {
  await db.execute('''
    CREATE TABLE IF NOT EXISTS small_image (
      id INTEGER PRIMARY KEY,
      name TEXT,
      data BLOB
    )
  ''');
}

Future<void> setSmallImage(int id, String name, Uint8List data) async {
  await db.rawInsert('''
    INSERT OR REPLACE INTO small_image (id, name, data)
    VALUES (?, ?, ?)
  ''', [id, name, data]);
}

class SmallImageItem {
  final String name;
  final Uint8List data;

  SmallImageItem({required this.name, required this.data});
}

Future<SmallImageItem?> getSmallImage(int id) async {
  final result = await db.rawQuery('''
    SELECT name, data FROM small_image WHERE id = ?
  ''', [id]);
  if (result.isEmpty) {
    return null;
  }
  final item = result.first;
  return SmallImageItem(
    name: item['name'] as String,
    data: item['data'] as Uint8List,
  );
}

Future<void> clearSmallImages() {
  return db.rawDelete('''
    DELETE FROM small_image
  ''');
}

@riverpod
Future<SmallImageItem> smallImage(SmallImageRef ref, int id) async {
  final res = await getSmallImage(id);
  if (res == null) {
    final gallery = await ref.read(galleryJSProvider(id).future);
    if (gallery.files.isEmpty) {
      throw Exception('No files');
    }
    final gg = await ref.read(gGProvider.future);
    final url = gg.imgUrl(gallery.files.first, ImgType.smallSmallThumb);
    final response = await http.get(Uri.parse(url), headers: {
      'Referer': 'https://hitomi.la/',
    });
    if (response.statusCode != 200) {
      throw Exception('Failed to load image');
    }
    final data = response.bodyBytes;
    await setSmallImage(id, gallery.files.first.name, data);
    final item = SmallImageItem(name: gallery.files.first.name, data: data);
    return item;
  }
  return res;
}
