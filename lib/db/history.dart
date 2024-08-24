import 'dart:convert';
import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hitomi_search_plus/download/download.dart';
import 'package:hitomi_search_plus/main.dart';
import 'package:hitomi_search_plus/server/query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'history.freezed.dart';
part 'history.g.dart';

class HistoryItem {
  final int id;
  final String data;
  final int time;

  HistoryItem({required this.id, required this.data, required this.time});

  factory HistoryItem.fromMap(Map<String, dynamic> map) {
    return HistoryItem(
      id: map['id'] as int,
      data: map['data'] as String,
      time: map['time'] as int,
    );
  }

  SearchBuilder get searchBuilder {
    return SearchBuilder.fromJson(json.decode(data) as Map<String, dynamic>);
  }
}

Future<void> initHistory(Database db) async {
  await db.execute('''
    CREATE TABLE IF NOT EXISTS history (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      data TEXT,
      time INTEGER
    )
  ''');
}

Future<int> addHistory(String data) async {
  final time = DateTime.now().millisecondsSinceEpoch;
  return db.rawInsert('''
    INSERT INTO history (data, time) VALUES (?, ?)
  ''', [data, time]);
}

Future<bool> deleteHistory(int id) {
  return db.rawDelete('''
    DELETE FROM history WHERE id = ?
  ''', [id]).then((value) => value > 0);
}

Future<void> deleteHistories() {
  return db.rawDelete('''
    DELETE FROM history
  ''');
}

Future<int> getHistoryCount() {
  return db.rawQuery('''
    SELECT COUNT(*) FROM history
  ''').then((value) => value.first.values.first as int);
}

Future<List<HistoryItem>> getHistories(int offset, int limit) async {
  final result = await db.rawQuery('''
    SELECT * FROM history
    ORDER BY time DESC
    LIMIT ? OFFSET ?
  ''', [limit, offset]);

  return result.map((e) => HistoryItem.fromMap(e)).toList();
}

const _pageSize = 50;
int? _start = 0;
final cache = List<HistoryItem?>.filled(_pageSize, null, growable: false);

void _cleanCache() {
  _start = null;
}

final _loadSignal = Signal.create();
bool _loading = false;

HistoryItem? getCache(int index) {
  if (_start == null || index < _start! || _start! + _pageSize <= index) {
    return null;
  }
  return cache[index - _start!];
}

Future<HistoryItem?> loadCache(int index) async {
  var c = getCache(index);
  if (c != null) {
    return c;
  }
  while (_loading) {
    await _loadSignal.waitNext();
    c = getCache(index);
    if (c != null) {
      return c;
    }
  }
  _loading = true;
  final start = max(0, index - _pageSize ~/ 2);
  final res = await getHistories(start, _pageSize);
  for (var i = 0; i < res.length; i++) {
    cache[i] = res[i];
  }
  for (var i = res.length; i < _pageSize; i++) {
    cache[i] = null;
  }
  final item = cache[index - start];
  _start = start;
  _loading = false;
  _loadSignal.complete();
  return item;
}

@freezed
class HistoryState with _$HistoryState {
  const HistoryState._();
  const factory HistoryState({
    required int length,
    required int varsion,
  }) = _HistoryState;

  HistoryState update(int length) {
    return copyWith(length: length, varsion: varsion + 1);
  }
}

@Riverpod(keepAlive: true)
class History extends _$History {
  @override
  HistoryState build() {
    Future(() {
      load();
    });
    return const HistoryState(
      length: 0,
      varsion: 0,
    );
  }

  Future<void> load() async {
    final count = await getHistoryCount();
    state = state.copyWith(length: count);
  }

  Future<void> add(SearchBuilder data) async {
    await addHistory(json.encode(data.toJson()));
    _cleanCache();
    state = state.update(state.length + 1);
  }

  Future<void> remove(int id) async {
    final res = await deleteHistory(id);
    if (res) {
      _cleanCache();
      state = state.update(state.length - 1);
    }
  }
}

@riverpod
Future<HistoryItem?> getHistory(GetHistoryRef ref, int index) {
  final v = ref.watch(historyProvider.select((e) => loadCache(index)));
  return v;
}
