import 'package:flutter/material.dart' hide SearchController;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hitomi_search_plus/component/default_query.dart';
import 'package:hitomi_search_plus/component/query_form.dart';
import 'package:hitomi_search_plus/db/bookmark.dart';
import 'package:hitomi_search_plus/db/default_query.dart';
import 'package:hitomi_search_plus/server/query.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookmarkEditScreen extends HookConsumerWidget {
  final int id;

  const BookmarkEditScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmark = ref.watch(bookmarkGetProvider(id));
    if (bookmark == null) {
      return const Scaffold(body: Center(child: Text('Bookmark not found')));
    }
    final titleController = useTextEditingController(text: bookmark.title);
    final controller = useMemoized(
        () => SearchController(initialQuery: bookmark.searchBuilder.query));
    useEffect(() {
      return controller.dispose;
    }, [controller]);
    final defController = useMemoized(() {
      final defaultValue = ref
          .read(defaultQueryDataProvider.notifier)
          .updateSelect(bookmark.searchBuilder.defaultQuery);
      return OneLineDefaultQueryController(initialSelected: defaultValue);
    });

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        ref.read(bookmarkProvider.notifier).edit(
            id,
            bookmark.searchBuilder
                .copyWith(defaultQuery: defController.selected),
            titleController.text);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Bookmark'),
          actions: [
            IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                ref.read(bookmarkProvider.notifier).remove(id);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: FocusTraversalGroup(
                        child: Column(
                          children: [
                            TextField(
                              controller: titleController,
                              decoration: const InputDecoration(
                                labelText: 'Bookmark Title',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            QueryForm(controller: controller),
                            Expanded(
                              child: SearchSuggestions(controller: controller),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: DefaultQueryPC(controller: defController),
                    ),
                  ],
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Bookmark Title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    OneLineDefaultQuery(controller: defController),
                    const SizedBox(height: 4),
                    QueryForm(controller: controller),
                    Expanded(
                      child: SearchSuggestions(controller: controller),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class BookmarkCreateScreen extends HookConsumerWidget {
  const BookmarkCreateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final controller = useMemoized(() => SearchController());
    final defController = useMemoized(() {
      final defaultValue =
          ref.read(defaultQueryDataProvider.notifier).defaultSelect();
      return OneLineDefaultQueryController(initialSelected: defaultValue);
    });
    useEffect(() {
      return controller.dispose;
    }, [controller]);

    bool isSaving = false;

    void saveBookmark() {
      if (isSaving) {
        return;
      }
      final query = controller.queryText;
      final title = titleController.text.trim();
      if (query.isNotEmpty) {
        ref.read(bookmarkProvider.notifier).add(
            SearchBuilder(query: query, defaultQuery: defController.selected),
            title: title);
        isSaving = true;
      }
    }

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) => saveBookmark(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Bookmark'),
          actions: [
            IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () {
                isSaving = true;
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                saveBookmark();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: FocusTraversalGroup(
                        child: Column(
                          children: [
                            TextField(
                              controller: titleController,
                              decoration: const InputDecoration(
                                labelText: 'Bookmark Title',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            QueryForm(controller: controller),
                            Expanded(
                              child: SearchSuggestions(controller: controller),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: DefaultQueryPC(controller: defController),
                    ),
                  ],
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Bookmark Title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    OneLineDefaultQuery(controller: defController),
                    const SizedBox(height: 4),
                    QueryForm(controller: controller),
                    Expanded(
                      child: SearchSuggestions(controller: controller),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
