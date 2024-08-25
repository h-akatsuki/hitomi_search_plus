import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hitomi_search_plus/db/kv.dart';
import 'package:hitomi_search_plus/server/query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'default_query.freezed.dart';
part 'default_query.g.dart';

@freezed
class DefaultQueryList with _$DefaultQueryList {
  factory DefaultQueryList({
    required int nextId,
    required List<DefaultQuery> queries,
  }) = _DefaultQueryList;

  factory DefaultQueryList.fromJson(Map<String, dynamic> json) =>
      _$DefaultQueryListFromJson(json);

  factory DefaultQueryList.init() => DefaultQueryList(
        nextId: 1,
        queries: [
          DefaultQuery(
            id: 0,
            query: 'language:english',
            title: 'You can add your default query',
            defaultValue: false,
          )
        ],
      );
}

@freezed
class DefaultQuery with _$DefaultQuery {
  factory DefaultQuery({
    required int id,
    required String query,
    required String title,
    required bool defaultValue,
  }) = _DefaultQuery;

  factory DefaultQuery.fromJson(Map<String, dynamic> json) =>
      _$DefaultQueryFromJson(json);
}

const key = 'default_query';

DefaultQueryList? _defaultQueryList;
Future<void> initDefaultQuery() async {
  final res = await getKV(key);
  if (res == null) {
    _defaultQueryList = DefaultQueryList.init();
  } else {
    _defaultQueryList =
        DefaultQueryList.fromJson(json.decode(res) as Map<String, dynamic>);
  }
}

@freezed
class SelectDefaultQuery with _$SelectDefaultQuery {
  const factory SelectDefaultQuery(
    List<int> selected,
    int newestId,
  ) = _SelectDefaultQuery;

  factory SelectDefaultQuery.fromJson(Map<String, dynamic> json) =>
      _$SelectDefaultQueryFromJson(json);
}

@Riverpod(keepAlive: true)
class DefaultQueryData extends _$DefaultQueryData {
  @override
  DefaultQueryList build() {
    final res = _defaultQueryList;
    _defaultQueryList = null;
    return res!;
  }

  Future<void> add(DefaultQuery data) async {
    final id = state.nextId;
    final add = data.copyWith(id: id);
    state = DefaultQueryList(
      nextId: id + 1,
      queries: [...state.queries, add],
    );
    await _saveToStorage();
  }

  Future<void> remove(int id) async {
    state = state.copyWith(
        queries: state.queries.where((element) => element.id != id).toList());
    await _saveToStorage();
  }

  SelectDefaultQuery defaultSelect() {
    final ids = state.queries
        .where((element) => element.defaultValue)
        .map((e) => e.id)
        .toList();
    return SelectDefaultQuery(ids, state.nextId - 1);
  }

  SelectDefaultQuery updateSelect(SelectDefaultQuery select) {
    final nowIds = Set.from(state.queries.map((e) => e.id));
    final ids = [
      ...select.selected.where((element) => nowIds.contains(element)),
      ...state.queries
          .where(
              (element) => element.defaultValue && element.id > select.newestId)
          .map((e) => e.id)
    ];
    return SelectDefaultQuery(ids, state.nextId - 1);
  }

  Future<void> reorderQueries(int oldIndex, int newIndex) async {
    final queries = List<DefaultQuery>.from(state.queries);
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = queries.removeAt(oldIndex);
    queries.insert(newIndex, item);

    state = state.copyWith(queries: queries);
    await _saveToStorage();
  }

  Future<void> updateQuery(
      int id, String newQuery, String newTitle, bool newDefaultValue) async {
    final updatedQueries = state.queries.map((query) {
      if (query.id == id) {
        return DefaultQuery(
          id: id,
          query: newQuery,
          title: newTitle,
          defaultValue: newDefaultValue,
        );
      }
      return query;
    }).toList();

    state = state.copyWith(queries: updatedQueries);
    await _saveToStorage();
  }

  Future<void> _saveToStorage() async {
    await setKV(key, json.encode(state.toJson()));
  }

  String toQuery(SearchBuilder searchBuilder) {
    final trimQuery = searchBuilder.query.trim();
    final buffer = StringBuffer();
    if (trimQuery.isNotEmpty) {
      buffer.write("($trimQuery) ");
    }
    for (final id in searchBuilder.defaultQuery.selected) {
      for (final query in state.queries) {
        if (query.id == id) {
          buffer.write("(${query.query}) ");
          break;
        } else if (query.defaultValue &&
            query.id > searchBuilder.defaultQuery.newestId) {
          buffer.write("(${query.query}) ");
          break;
        }
      }
    }
    if (buffer.isEmpty) {
      return '';
    }
    return buffer.toString();
  }

  Future<void> set(DefaultQueryList data) {
    state = data;
    return _saveToStorage();
  }
}

@riverpod
class DefaultQuerySingle extends _$DefaultQuerySingle {
  @override
  DefaultQuery? build(int id) {
    final data = ref.watch(defaultQueryDataProvider.select(
      (value) {
        return value.queries.firstWhere((element) => element.id == id);
      },
    ));
    return data;
  }

  Future<void> save(String query, String title, bool defaultValue) async {
    if (state == null) {
      throw Exception('state is null');
    }
    await ref.read(defaultQueryDataProvider.notifier).updateQuery(
          id,
          query,
          title,
          defaultValue,
        );
  }

  Future<void> remove() async {
    await ref.read(defaultQueryDataProvider.notifier).remove(id);
  }
}
