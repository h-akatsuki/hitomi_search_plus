import 'package:hitomi_search_plus/main.dart';
import 'package:sqflite/sqflite.dart';

const int galleryCacheTime = 1000 * 60 * 60 * 24 * 7;

Future<void> initGalleryCache(Database db) async {
  await db.execute('''
    CREATE TABLE IF NOT EXISTS gallery_cache (
      id INTEGER PRIMARY KEY,
      time INTEGER,
      data TEXT
    )
  ''');
  await db.execute('''
    CREATE INDEX IF NOT EXISTS gallery_cache_time ON gallery_cache (time)
  ''');
}

Future<void> setGalleryCache(int id, String data) async {
  await db.rawInsert('''
    INSERT OR REPLACE INTO gallery_cache (id, time, data) VALUES (?, ?, ?)
  ''', [id, DateTime.now().millisecondsSinceEpoch, data]);
}

Future<String?> getGalleryCache(int id) async {
  final res = await db.rawQuery('''
    SELECT time, data FROM gallery_cache WHERE id = ?
  ''', [id]);

  if (res.isEmpty) {
    return null;
  } else {
    final time = res.first['time'] as int;
    if (DateTime.now().millisecondsSinceEpoch - time > galleryCacheTime) {
      return null;
    }
    return res.first['data'] as String;
  }
}

Future<void> clearExpiredGalleryCache() async {
  await db.rawDelete('''
    DELETE FROM gallery_cache WHERE time < ?
  ''', [DateTime.now().millisecondsSinceEpoch - galleryCacheTime]);
}
