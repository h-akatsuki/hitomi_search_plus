import 'package:flutter/material.dart';
import 'package:hitomi_search_plus/db/history.dart';
import 'package:hitomi_search_plus/page/search.dart';
import 'package:hitomi_search_plus/server/query.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoryList extends ConsumerWidget {
  final bool pop;
  final void Function(SearchBuilder) onSelect;
  const HistoryList({super.key, required this.onSelect, this.pop = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyList = ref.watch(historyProvider.select((v) => v.length));
    return ListView.builder(
      itemCount: historyList,
      itemBuilder: (context, index) {
        return HistoryItem(
            index: index,
            onSelect: onSelect,
            onTap: () {
              if (pop) {
                Navigator.of(context).pop();
              }
            });
      },
    );
  }
}

class HistoryItem extends ConsumerWidget {
  final void Function(SearchBuilder) onSelect;
  final VoidCallback? onTap;
  final int index;

  const HistoryItem(
      {super.key, required this.index, required this.onSelect, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(getHistoryProvider(index));
    return ListTile(
      title: Text(history.value?.searchBuilder.query ?? 'Loading...'),
      onTap: () {
        if (history.value != null) {
          onSelect(history.value!.searchBuilder);
          onTap?.call();
        }
      },
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          ref.read(historyProvider.notifier).remove(history.value!.id);
        },
      ),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  final void Function(SearchBuilder) onSelect;
  const HistoryScreen({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: HistoryList(onSelect: onSelect),
    );
  }
}

class HistoryScreenPage extends StatelessWidget {
  const HistoryScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: HistoryList(
          onSelect: (builder) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    SearchScreen(initialSearchBuilder: builder)));
          },
          pop: false),
    );
  }
}
