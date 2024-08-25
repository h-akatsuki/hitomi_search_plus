import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hitomi_search_plus/db/default_query.dart';
import 'package:hitomi_search_plus/main.dart';
import 'package:hitomi_search_plus/server/user.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'export.freezed.dart';
part 'export.g.dart';

@freezed
class BookmarkExportItem with _$BookmarkExportItem {
  BookmarkExportItem._();
  factory BookmarkExportItem({
    required int id,
    required String query,
    required String defaultQuery,
    required String? title,
    required int addedAt,
  }) = _BookmarkExportItem;

  factory BookmarkExportItem.fromJson(Map<String, dynamic> json) =>
      _$BookmarkExportItemFromJson(json);
}

@freezed
class BookmarkExport with _$BookmarkExport {
  BookmarkExport._();
  factory BookmarkExport({
    required List<BookmarkExportItem> items,
  }) = _BookmarkExport;

  factory BookmarkExport.fromJson(Map<String, dynamic> json) =>
      _$BookmarkExportFromJson(json);
}

@freezed
class LikeExportItem with _$LikeExportItem {
  LikeExportItem._();
  factory LikeExportItem({
    required int id,
    required int addedAt,
  }) = _LikeExportItem;

  factory LikeExportItem.fromJson(Map<String, dynamic> json) =>
      _$LikeExportItemFromJson(json);
}

@freezed
class ExportData with _$ExportData {
  ExportData._();
  factory ExportData({
    required BookmarkExport bookmarks,
    required DefaultQueryList defaultQueryList,
    required List<LikeExportItem> likes,
  }) = _ExportData;

  factory ExportData.fromJson(Map<String, dynamic> json) =>
      _$ExportDataFromJson(json);
}

const url = 'https://hitomi.hiro.red/user';

enum SyncState {
  none,
  working,
  error,
}

@freezed
class DataSyncs with _$DataSyncs {
  factory DataSyncs({
    required SyncState upload,
    required SyncState download,
  }) = _DataSyncs;
}

@riverpod
class DataSyncState extends _$DataSyncState {
  @override
  DataSyncs build() {
    return DataSyncs(
      upload: SyncState.none,
      download: SyncState.none,
    );
  }

  bool get isWorking =>
      state.upload == SyncState.working || state.download == SyncState.working;

  void startDownload() {
    state = state.copyWith(download: SyncState.working);
  }

  void startUpload() {
    state = state.copyWith(upload: SyncState.working);
  }

  void endDownload() {
    state = state.copyWith(download: SyncState.none);
  }

  void endUpload() {
    state = state.copyWith(upload: SyncState.none);
  }

  void errorDownload() {
    state = state.copyWith(download: SyncState.error);
  }

  void errorUpload() {
    state = state.copyWith(upload: SyncState.error);
  }
}

@Riverpod(keepAlive: true)
class DataSync extends _$DataSync {
  @override
  int build() {
    return 0;
  }

  Future<void> uploadData() async {
    if (ref.read(dataSyncStateProvider.notifier).isWorking) {
      return;
    }
    ref.read(dataSyncStateProvider.notifier).startUpload();

    final id = await ref.read(userUUIDProvider.future);
    try {
      final data = await exportData();
      final res = await http.put(
        Uri.parse(url),
        body: data,
        headers: {
          'X-User-Id': id,
          'Content-Type': 'text/plain',
        },
        encoding: const Utf8Codec(),
      );
      if (res.statusCode != 200) {
        throw Exception('Failed to upload: ${res.body}');
      }
    } catch (e) {
      debugPrint('upload error: $e');
      ref.read(dataSyncStateProvider.notifier).errorUpload();
      return;
    }
    ref.read(dataSyncStateProvider.notifier).endUpload();
  }

  Future<void> downloadData() async {
    if (ref.read(dataSyncStateProvider.notifier).isWorking) {
      return;
    }
    ref.read(dataSyncStateProvider.notifier).startDownload();

    final id = await ref.read(userUUIDProvider.future);
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'X-User-Id': id,
        },
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to download: ${response.body}');
      }
      await importData(response.body);
    } catch (e) {
      debugPrint('download error: $e');
      ref.read(dataSyncStateProvider.notifier).errorDownload();
      return;
    }
    ref.read(dataSyncStateProvider.notifier).endDownload();
  }

  Future<String> exportData() async {
    final bookmarks = await db.rawQuery('''
    SELECT id, query, default_query, title, added_at FROM bookmark
  ''');
    final bookmarkItems = bookmarks
        .map((e) => BookmarkExportItem(
              id: e['id'] as int,
              query: e['query'] as String,
              defaultQuery: e['default_query'] as String,
              title: e['title'] as String?,
              addedAt: e['added_at'] as int,
            ))
        .toList();

    final likes = await db.rawQuery('''
    SELECT id, added_at FROM like
  ''');

    final likeItems = likes
        .map((e) => LikeExportItem(
              id: e['id'] as int,
              addedAt: e['added_at'] as int,
            ))
        .toList();

    final defaultQueryList = ref.read(defaultQueryDataProvider);

    final exportData = ExportData(
      bookmarks: BookmarkExport(items: bookmarkItems),
      defaultQueryList: defaultQueryList,
      likes: likeItems,
    );

    return jsonEncode(exportData.toJson());
  }

  Future<void> importData(String data) async {
    final exportData = ExportData.fromJson(jsonDecode(data));

    await ref
        .read(defaultQueryDataProvider.notifier)
        .set(exportData.defaultQueryList);
    await db.transaction((txn) async {
      final List<Map<String, dynamic>> existingIds = await txn.query(
        'bookmark',
        columns: ['id'],
      );
      final Set<int> existingIdSet =
          existingIds.map((e) => e['id'] as int).toSet();
      for (final item in exportData.bookmarks.items) {
        final existingBookmark = await txn.query(
          'bookmark',
          where: 'id = ?',
          whereArgs: [item.id],
        );

        if (existingBookmark.isNotEmpty) {
          await txn.update(
            'bookmark',
            {
              'query': item.query,
              'default_query': item.defaultQuery,
              'title': item.title,
              'added_at': item.addedAt,
            },
            where: 'id = ?',
            whereArgs: [item.id],
          );
        } else {
          await txn.insert(
            'bookmark',
            {
              'id': item.id,
              'query': item.query,
              'default_query': item.defaultQuery,
              'title': item.title,
              'added_at': item.addedAt,
              'success': 0,
              'error': "Data has not been fetched yet",
              'newest_gallery_id': null,
              'count': null,
              'data': null,
            },
          );
        }

        existingIdSet.remove(item.id);
      }
      for (final idToDelete in existingIdSet) {
        await txn.delete(
          'bookmark',
          where: 'id = ?',
          whereArgs: [idToDelete],
        );
      }
    });

    await db.transaction((txn) async {
      final List<Map<String, dynamic>> existingIds = await txn.query(
        'like',
        columns: ['id'],
      );
      final Set<int> existingIdSet =
          existingIds.map((e) => e['id'] as int).toSet();
      for (final item in exportData.likes) {
        final existingLike = await txn.query(
          'like',
          where: 'id = ?',
          whereArgs: [item.id],
        );

        int done;
        if (existingLike.isNotEmpty) {
          done = existingLike.first['done'] as int;
        } else {
          final taskResult = await txn.query(
            'tasks',
            where: 'id = ?',
            whereArgs: [item.id],
          );

          if (taskResult.isNotEmpty) {
            final task = taskResult.first;
            done = (task['total'] as int == task['done'] as int) ? 1 : 0;
          } else {
            done = 0;
          }
        }

        if (existingLike.isNotEmpty) {
          await txn.update(
            'like',
            {
              'added_at': item.addedAt,
              'done': done,
            },
            where: 'id = ?',
            whereArgs: [item.id],
          );
        } else {
          await txn.insert(
            'like',
            {
              'id': item.id,
              'added_at': item.addedAt,
              'done': done,
            },
          );
        }

        existingIdSet.remove(item.id);
      }
      for (final idToDelete in existingIdSet) {
        await txn.delete(
          'like',
          where: 'id = ?',
          whereArgs: [idToDelete],
        );
      }
    });
    state = state + 1;
  }
}
