import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hitomi_search_plus/component/bookmark.dart';
import 'package:hitomi_search_plus/component/custom_list.dart';
import 'package:hitomi_search_plus/component/jump_fab.dart';
import 'package:hitomi_search_plus/component/thumbnail.dart';
import 'package:hitomi_search_plus/db/default_query.dart';
import 'package:hitomi_search_plus/server/query.dart';
import 'package:hitomi_search_plus/tools/hook.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GalleryKey {
  final int id;
  const GalleryKey(this.id);

  @override
  bool operator ==(Object other) {
    if (other is GalleryKey) {
      return id == other.id;
    }
    return false;
  }

  @override
  int get hashCode => id.hashCode;
}

class Galleries extends StatelessWidget {
  final Uint32List results;
  final FixedSizeListViewController? controller;
  const Galleries({super.key, required this.results, this.controller});

  @override
  Widget build(BuildContext context) {
    return FixedSizeCustomListView(
      itemHeight: 180,
      controller: controller,
      itemCount: results.length,
      itemBuilder: (context, index) {
        final gallery = results[results.length - index - 1];
        return GalleryThumbnail(
          key: ValueKey(GalleryKey(gallery)),
          id: gallery,
        );
      },
    );
  }
}

class SimpleGalleries extends StatelessWidget {
  final Uint32List results;
  const SimpleGalleries({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 180,
      itemCount: results.length,
      itemBuilder: (context, index) {
        final gallery = results[results.length - index - 1];
        return GalleryThumbnail(
          key: ValueKey(GalleryKey(gallery)),
          id: gallery,
        );
      },
    );
  }
}

String queryToTitle(String query) {
  if (query.isEmpty) {
    return 'All Galleries';
  }
  if (query.length > 20) {
    return '${query.substring(0, 20)}...';
  }
  return query;
}

class GalleriesResult extends HookConsumerWidget {
  final SearchBuilder query;

  const GalleriesResult({super.key, required this.query});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = useMemoized(
        () => ref.read(defaultQueryDataProvider.notifier).toQuery(query),
        [query]);
    final controller = useFixedSizeListViewController();
    final memo = useMemoized(() async {
      final query = await searchOne(searchQuery);
      return query;
    }, [query]);
    final results = useFuture(memo);
    return Scaffold(
      appBar: AppBar(
        title: Text(queryToTitle(query.query)),
        actions: [
          BookmarkIcon(query: query),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: StreamBuilder(
              stream: controller.scrollProgress,
              builder: (context, snapshot) {
                return LinearProgressIndicator(value: snapshot.data ?? 0.0);
              }),
        ),
      ),
      body: results.hasData
          ? results.data is SearchResultsSuccess
              ? Galleries(
                  controller: controller,
                  results: (results.data as SearchResultsSuccess).results)
              : results.data is SearchResultsError
                  ? Center(
                      child: Text(
                          'Error: ${(results.data as SearchResultsError).error}'))
                  : const Center(child: Text('Unknown error'))
          : const Center(child: CircularProgressIndicator()),
      floatingActionButton:
          results.hasData && results.data is SearchResultsSuccess
              ? PageJumpWidget(
                  initialIndex: 0,
                  pageStream: controller.currentPage,
                  total: (results.data as SearchResultsSuccess).results.length,
                  onJump: controller.jump,
                )
              : null,
    );
  }
}
