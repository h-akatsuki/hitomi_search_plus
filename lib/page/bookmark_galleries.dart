import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hitomi_search_plus/component/jump_fab.dart';
import 'package:hitomi_search_plus/db/bookmark.dart';
import 'package:hitomi_search_plus/page/edit_bookmark.dart';
import 'package:hitomi_search_plus/page/galleries.dart';
import 'package:hitomi_search_plus/tools/hook.dart';
import 'package:hitomi_search_plus/tools/suger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookmarkGalleries extends HookConsumerWidget {
  final int id;

  const BookmarkGalleries({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmark = ref.watch(bookmarkGetProvider(id));
    final controller = useFixedSizeListViewController();
    final memo = useMemoized(() async {
      final data = await getBookmarkData(id);
      if (data == null) {
        throw 'Data not found';
      }
      return data;
    }, [id]);

    final results = useFuture(memo);

    return Scaffold(
      appBar: AppBar(
        title: Text(bookmark?.title ??
            queryToTitle(bookmark?.searchBuilder.query ?? '')),
        actions: [
          IconButton(
            onPressed: () => context.push(BookmarkEditScreen(id: id)),
            icon: const Icon(Icons.edit),
          ),
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
      body: results.hasError
          ? Center(
              child: Text(results.error.toString()),
            )
          : results.hasData
              ? Galleries(results: results.data!, controller: controller)
              : const Center(child: CircularProgressIndicator()),
      floatingActionButton: PageJumpWidget(
        initialIndex: 0,
        pageStream: controller.currentPage,
        total: results.hasData ? results.data!.length : 0,
        onJump: controller.jump,
      ),
    );
  }
}
