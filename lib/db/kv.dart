import 'package:hitomi_search_plus/main.dart';
import 'package:sqflite/sqflite.dart';

Future<void> initKV(Database db) async {
  await db.execute('''
    CREATE TABLE IF NOT EXISTS kv (
      key TEXT PRIMARY KEY,
      value TEXT
    )
  ''');
}

Future<void> setKV(String key, String value) async {
  await db.rawInsert('''
    INSERT OR REPLACE INTO kv (key, value) VALUES (?, ?)
  ''', [key, value]);
}

Future<String?> getKV(String key) async {
  final res = await db.rawQuery('''
    SELECT value FROM kv WHERE key = ?
  ''', [key]);
  if (res.isEmpty) {
    return null;
  } else {
    return res.first['value'] as String;
  }
}

Future<void> deleteKV(String key) async {
  await db.rawDelete('''
    DELETE FROM kv WHERE key = ?
  ''', [key]);
}

Future<void> setKVBool(String key, bool value) async {
  await setKV(key, value ? 't' : 'f');
}

Future<bool?> getKVBool(String key) async {
  final res = await getKV(key);
  if (res == null) {
    return null;
  } else {
    return res == 't';
  }
}

Future<void> setKVInt(String key, int value) async {
  await setKV(key, value.toString());
}

Future<int?> getKVInt(String key) async {
  final res = await getKV(key);
  if (res == null) {
    return null;
  } else {
    return int.parse(res);
  }
}
