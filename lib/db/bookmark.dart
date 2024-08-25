import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hitomi_search_plus/db/default_query.dart';
import 'package:hitomi_search_plus/db/export.dart';
import 'package:hitomi_search_plus/db/kv.dart';
import 'package:hitomi_search_plus/main.dart';
import 'package:hitomi_search_plus/server/query.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'bookmark.g.dart';

Future<void> initBookmark(Database db) async {
  await db.execute('''
    CREATE TABLE IF NOT EXISTS bookmark (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      query TEXT,
      default_query TEXT,
      success INTEGER,
      error TEXT,
      newest_gallery_id INTEGER,
      count INTEGER,
      title TEXT,
      added_at INTEGER,
      data BLOB
    )
  ''');

  await db.execute('''
    CREATE INDEX IF NOT EXISTS bookmark_query ON bookmark (query)
  ''');
}

class BookmarkItem {
  final int id;
  final SearchBuilder searchBuilder;
  String? title;
  final int addedAt;
  final BookmarkInner inner;

  BookmarkItem({
    required this.id,
    required this.searchBuilder,
    this.title,
    required this.addedAt,
    required this.inner,
  });

  static BookmarkItem fromMap(Map<String, dynamic> map) {
    final inner = map['success'] == 1
        ? BookmarkSuccess(
            newestGalleryId: map['newest_gallery_id'] as int?,
            count: map['count'] as int,
          )
        : BookmarkError(
            error: map['error'] as String,
          );
    final defaultQuery =
        SelectDefaultQuery.fromJson(jsonDecode(map['default_query']));
    final searchBuilder = SearchBuilder(
      query: map['query'] as String,
      defaultQuery: defaultQuery,
    );
    return BookmarkItem(
      id: map['id'] as int,
      searchBuilder: searchBuilder,
      title: map['title'] as String?,
      addedAt: map['added_at'] as int,
      inner: inner,
    );
  }

  BookmarkItem copyWith({
    int? id,
    SearchBuilder? searchBuilder,
    String? title,
    int? addedAt,
    BookmarkInner? inner,
  }) {
    return BookmarkItem(
      id: id ?? this.id,
      searchBuilder: searchBuilder ?? this.searchBuilder,
      title: title ?? this.title,
      addedAt: addedAt ?? this.addedAt,
      inner: inner ?? this.inner,
    );
  }
}

abstract class BookmarkInner {}

class BookmarkSuccess implements BookmarkInner {
  final int? newestGalleryId;
  final int count;

  BookmarkSuccess({
    required this.newestGalleryId,
    required this.count,
  });
}

class BookmarkError implements BookmarkInner {
  final String error;

  BookmarkError({
    required this.error,
  });
}

Future<int?> isBookmarked(String query) async {
  final res = await db.rawQuery('''
    SELECT id FROM bookmark WHERE query = ?
  ''', [query.trim()]);

  if (res.isEmpty) {
    return null;
  } else {
    return res.first['id'] as int;
  }
}

Future<BookmarkItem> createBookmark(SearchBuilder searchBuilder) async {
  final id = await isBookmarked(searchBuilder.query);
  if (id != null) {
    return BookmarkItem(
        id: id,
        searchBuilder: searchBuilder,
        addedAt: 0,
        inner: BookmarkError(error: 'Data has not been fetched yet'));
  }
  final addedAt = DateTime.now().millisecondsSinceEpoch;
  const success = 0;
  const error = 'Data has not been fetched yet';
  final defaultQueryJson = jsonEncode(searchBuilder.defaultQuery.toJson());
  await db.rawInsert('''
    INSERT INTO bookmark (query, default_query, success, error, added_at) VALUES (?, ?, ?, ?, ?)
  ''', [searchBuilder.query.trim(), defaultQueryJson, success, error, addedAt]);
  return BookmarkItem(
      id: (await isBookmarked(searchBuilder.query))!,
      searchBuilder: searchBuilder,
      addedAt: addedAt,
      inner: BookmarkError(error: error));
}

Future<void> updateFromSearchResults(
  Transaction? txn,
  int id,
  SearchResultsReaderItem item,
) async {
  final data = item is SearchResultsReaderSuccess ? item.results : null;
  final success = item is SearchResultsReaderSuccess ? 1 : 0;
  final error = item is SearchResultsReaderError ? item.error : null;
  final count = item is SearchResultsReaderSuccess ? item.count : null;
  final newestGalleryId =
      item is SearchResultsReaderSuccess ? item.newest : null;
  if (txn != null) {
    await txn.rawUpdate('''
    UPDATE bookmark SET success = ?, error = ?, count = ?, newest_gallery_id = ?, data = ? WHERE id = ?
  ''', [success, error, count, newestGalleryId, data, id]);
  } else {
    await db.rawUpdate('''
    UPDATE bookmark SET success = ?, error = ?, count = ?, newest_gallery_id = ?, data = ? WHERE id = ?
  ''', [success, error, count, newestGalleryId, data, id]);
  }
}

Future<void> deleteBookmark(int id) async {
  await db.rawDelete('''
    DELETE FROM bookmark WHERE id = ?
  ''', [id]);
}

Future<List<BookmarkItem>> loadBookmarks() async {
  final res = await db.rawQuery('''
    SELECT id, query, default_query, title, added_at, success, error, newest_gallery_id, count FROM bookmark ORDER BY newest_gallery_id DESC
  ''');
  return res.map((e) => BookmarkItem.fromMap(e)).toList();
}

Future<void> editBookmark(
  int id,
  SearchBuilder searchBuilder,
  String? title,
) async {
  final defaultQueryJson = jsonEncode(searchBuilder.defaultQuery.toJson());
  await db.rawUpdate('''
    UPDATE bookmark SET query = ?, default_query = ?, title = ? WHERE id = ?
  ''', [searchBuilder.query.trim(), defaultQueryJson, title, id]);
}

Future<Uint32List?> getBookmarkData(int id) async {
  final res = await db.rawQuery('''
    SELECT data FROM bookmark WHERE id = ?
  ''', [id]);

  if (res.isEmpty) {
    return null;
  }

  final data = res.first['data'] as Uint8List?;
  if (data == null) {
    return null;
  }

  return Uint32List.view(data.buffer);
}

enum UpdaterState {
  idle,
  updating,
  error,
}

@Riverpod(keepAlive: true)
class UpdateingBookmark extends _$UpdateingBookmark {
  @override
  UpdaterState build() {
    return UpdaterState.idle;
  }

  void start() {
    state = UpdaterState.updating;
  }

  void end() {
    state = UpdaterState.idle;
  }

  void setError() {
    state = UpdaterState.error;
  }
}

const lastUpdateKey = 'bookmark_last_update';

@Riverpod(keepAlive: true)
class BookmarkLastUpdate extends _$BookmarkLastUpdate {
  @override
  String build() {
    Future(() async {
      await load();
    });
    return "Loading...";
  }

  load() async {
    final lastUpdate = await getKV(lastUpdateKey);
    if (lastUpdate != null) {
      state = lastUpdate;
    } else {
      state = "Never";
    }
  }

  void update() async {
    final now = DateTime.now();
    final date = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    state = date;
    await setKV(lastUpdateKey, date);
  }
}

@Riverpod(keepAlive: true)
class Bookmark extends _$Bookmark {
  Future<void> load() async {
    final res = await loadBookmarks();
    state = res;
  }

  @override
  List<BookmarkItem> build() {
    ref.watch(dataSyncProvider);
    Future(() async {
      await load();
      await update();
    });
    return [];
  }

  void add(SearchBuilder searchBuilder, {String? title}) async {
    BookmarkItem item = await createBookmark(searchBuilder);
    if (title != null) {
      await editBookmark(item.id, searchBuilder, title);
      item = item.copyWith(title: title);
    }
    state = [...state, item];
    Future(() {
      update();
    });
  }

  void remove(int id) async {
    await deleteBookmark(id);
    state = state.where((e) => e.id != id).toList();
  }

  Future<void> update() async {
    final updating = ref.read(updateingBookmarkProvider);
    if (updating == UpdaterState.updating) {
      return;
    }
    ref.read(updateingBookmarkProvider.notifier).start();
    final ids = state.map((e) => e.id).toList();
    final queries = state.map((e) => e.searchBuilder).toList();
    final len = ids.length;
    for (var i = 0; i < len; i += 10) {
      final end = min(i + 10, len);
      final subIds = ids.sublist(i, end);
      final subQueries = queries.sublist(i, end);
      try {
        final res = await searchReader(SearchParams(
            queries: subQueries.map((e) {
          return ref.read(defaultQueryDataProvider.notifier).toQuery(e);
        }).toList()));
        await db.transaction((txn) async {
          for (final id in subIds) {
            final item = res.next()!;
            await updateFromSearchResults(txn, id, item);
          }
        });
      } catch (e) {
        debugPrint('update error: $e');
        ref.read(updateingBookmarkProvider.notifier).setError();
        return;
      }
      await load();
    }
    ref.read(updateingBookmarkProvider.notifier).end();
    ref.read(bookmarkLastUpdateProvider.notifier).update();
  }

  void edit(int id, SearchBuilder searchBuilder, String? title) async {
    await editBookmark(id, searchBuilder, title);
    state = state.map((e) {
      if (e.id == id) {
        return e.copyWith(searchBuilder: searchBuilder, title: title);
      } else {
        return e;
      }
    }).toList();
    Future(() {
      update();
    });
  }
}

@riverpod
int? bookmarked(BookmarkedRef ref, String query) {
  final bookmarks = ref.watch(bookmarkProvider.select((b) {
    for (final bookmark in b) {
      if (bookmark.searchBuilder.query.trim() == query.trim()) {
        return bookmark.id;
      }
    }
    return null;
  }));
  return bookmarks;
}

@riverpod
BookmarkItem? bookmarkGet(BookmarkGetRef ref, int id) {
  final bookmarks = ref.watch(bookmarkProvider.select((b) {
    for (final bookmark in b) {
      if (bookmark.id == id) {
        return bookmark;
      }
    }
    return null;
  }));
  return bookmarks;
}
