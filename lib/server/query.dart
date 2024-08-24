import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hitomi_search_plus/db/default_query.dart';
import 'package:http/http.dart' as http;

part 'query.freezed.dart';
part 'query.g.dart';

@freezed
class SearchBuilder with _$SearchBuilder {
  factory SearchBuilder({
    required String query,
    required SelectDefaultQuery defaultQuery,
  }) = _SearchBuilder;

  factory SearchBuilder.fromJson(Map<String, dynamic> json) =>
      _$SearchBuilderFromJson(json);
}

@freezed
class SearchParams with _$SearchParams {
  factory SearchParams({
    required List<String> queries,
  }) = _SearchParams;

  factory SearchParams.fromJson(Map<String, dynamic> json) =>
      _$SearchParamsFromJson(json);
}

abstract class SearchResults {}

class SearchResultsSuccess implements SearchResults {
  final int count;
  final Uint32List results;
  SearchResultsSuccess(this.count, this.results);
}

class SearchResultsError implements SearchResults {
  final String error;
  SearchResultsError(this.error);
}

List<SearchResults> parseSearchResults(Uint8List data) {
  final view = ByteData.view(data.buffer);
  final res = <SearchResults>[];
  int offset = 0;
  while (offset < data.length) {
    final status = view.getUint8(offset);
    offset++;
    if (status == 0) {
      final count = view.getUint32(offset, Endian.little);
      offset += 4;
      final results = Uint32List(count);
      for (var i = 0; i < count; i++) {
        results[i] = view.getUint32(offset, Endian.little);
        offset += 4;
      }
      res.add(SearchResultsSuccess(count, results));
      offset += count * 4;
    } else if (status == 1) {
      final len = view.getUint32(offset, Endian.little);
      offset += 4;
      final error = String.fromCharCodes(data.sublist(offset, offset + len));
      offset += len;
      res.add(SearchResultsError(error));
    } else {
      throw Exception('Invalid status: $status');
    }
  }
  return res;
}

Future<List<SearchResults>> search(SearchParams params) async {
  final url = Uri.parse('https://hitomi.hiro.red/search');
  final response = await http.post(
    url,
    body: jsonEncode(params.toJson()),
    headers: {'Content-Type': 'application/json'},
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to search: ${response.body}');
  }
  return parseSearchResults(response.bodyBytes);
}

Future<SearchResults> searchOne(String query) async {
  final start = DateTime.now();
  final results = await search(SearchParams(queries: [query]));
  if (results.isEmpty) {
    throw Exception('No results');
  }
  debugPrint('searchOne: ${DateTime.now().difference(start).inMilliseconds}ms');
  return results.first;
}

class TestResults extends HookWidget {
  final String query;
  const TestResults(this.query, {super.key});

  @override
  Widget build(BuildContext context) {
    final memo = useMemoized(() => searchOne(query), [query]);
    final results = useFuture(memo);
    if (results.hasData) {
      final data = results.data;
      if (data is SearchResultsSuccess) {
        if (data.count == 0) {
          return const Text('No results');
        }
        return Text('Count: ${data.count} first: ${data.results[0]}');
      } else if (data is SearchResultsError) {
        return Text('Error: ${data.error}');
      } else {
        return const Text('Unknown data type');
      }
    } else if (results.hasError) {
      return Text('Error: ${results.error}');
    } else {
      return const CircularProgressIndicator();
    }
  }
}

abstract class SearchResultsReaderItem {}

class SearchResultsReaderSuccess implements SearchResultsReaderItem {
  final int count;
  final Uint8List results;
  final int? newest;
  SearchResultsReaderSuccess(this.count, this.results, {this.newest});
}

class SearchResultsReaderError implements SearchResultsReaderItem {
  final String error;
  SearchResultsReaderError(this.error);
}

class SearchResultsReader {
  final ByteData data;
  int offset = 0;

  SearchResultsReader(this.data);

  SearchResultsReaderItem? next() {
    if (offset >= data.lengthInBytes) {
      return null;
    }
    final status = data.getUint8(offset);
    offset++;
    if (status == 0) {
      final count = data.getUint32(offset, Endian.little);
      offset += 4;
      final results = data.buffer.asUint8List(offset, count * 4);
      offset += count * 4;
      final newest =
          count > 0 ? data.getUint32(offset - 4, Endian.little) : null;
      return SearchResultsReaderSuccess(count, results, newest: newest);
    } else if (status == 1) {
      final len = data.getUint32(offset, Endian.little);
      offset += 4;
      final error = String.fromCharCodes(data.buffer.asUint8List(offset, len));
      offset += len;
      return SearchResultsReaderError(error);
    } else {
      throw Exception('Invalid status: $status');
    }
  }
}

Future<SearchResultsReader> searchReader(SearchParams params) async {
  final url = Uri.parse('https://hitomi.hiro.red/search');
  final response = await http.post(
    url,
    body: jsonEncode(params.toJson()),
    headers: {'Content-Type': 'application/json'},
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to search: ${response.body}');
  }
  return SearchResultsReader(ByteData.view(response.bodyBytes.buffer));
}
