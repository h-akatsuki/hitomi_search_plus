import 'package:flutter/material.dart' hide SearchController;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hitomi_search_plus/component/query_form.dart';
import 'package:hitomi_search_plus/db/default_query.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DefaultQueryListScreen extends HookConsumerWidget {
  const DefaultQueryListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultQueries = ref.watch(defaultQueryDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Default Queries'),
      ),
      body: ReorderableListView.builder(
        itemCount: defaultQueries.queries.length,
        itemBuilder: (context, index) {
          final query = defaultQueries.queries[index];
          return Padding(
            key: Key(query.id.toString()),
            padding: const EdgeInsets.only(right: 16),
            child: ListTile(
              title: Text(query.title),
              subtitle: Text(query.query),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => {
                      ref
                          .read(defaultQueryDataProvider.notifier)
                          .remove(query.id),
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            DefaultQueryEditScreen(id: query.id),
                      )),
                    },
                  ),
                ],
              ),
            ),
          );
        },
        onReorder: (oldIndex, newIndex) {
          ref
              .read(defaultQueryDataProvider.notifier)
              .reorderQueries(oldIndex, newIndex);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const DefaultQueryCreateScreen(),
          )),
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DefaultQueryEditScreen extends HookConsumerWidget {
  final int id;
  const DefaultQueryEditScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultQuery = ref.watch(defaultQuerySingleProvider(id));
    if (defaultQuery == null) {
      return const Scaffold(body: Center(child: Text('Query not found')));
    }
    final titleController = useTextEditingController(text: defaultQuery.title);
    final controller =
        useMemoized(() => SearchController(initialQuery: defaultQuery.query));
    useEffect(() {
      return controller.dispose;
    }, [controller]);
    final value = useState(defaultQuery.defaultValue);

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        ref
            .read(defaultQuerySingleProvider(id).notifier)
            .save(controller.queryText, titleController.text, value.value);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Query'),
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
                ref.read(defaultQuerySingleProvider(id).notifier).remove();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Query Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: value.value,
                    onChanged: (v) {
                      value.value = v!;
                    },
                  ),
                  const Text('Default'),
                ],
              ),
              const SizedBox(height: 4),
              QueryForm(controller: controller),
              const SizedBox(height: 16),
              Expanded(
                child: SearchSuggestions(controller: controller),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DefaultQueryCreateScreen extends HookConsumerWidget {
  const DefaultQueryCreateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final controller = useMemoized(() => SearchController());
    final value = useState(false);
    useEffect(() {
      return controller.dispose;
    }, [controller]);

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (controller.query.isEmpty) {
          return;
        }
        ref.read(defaultQueryDataProvider.notifier).add(DefaultQuery(
              id: 0,
              query: controller.query,
              title: titleController.text,
              defaultValue: value.value,
            ));
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Query'),
          actions: [
            IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Query Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: value.value,
                    onChanged: (v) {
                      value.value = v!;
                    },
                  ),
                  const Text('Default'),
                ],
              ),
              const SizedBox(height: 4),
              QueryForm(controller: controller),
              const SizedBox(height: 16),
              Expanded(
                child: SearchSuggestions(controller: controller),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
