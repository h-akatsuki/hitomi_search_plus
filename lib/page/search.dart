import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hitomi_search_plus/component/query_form.dart';
import 'package:hitomi_search_plus/db/history.dart';
import 'package:hitomi_search_plus/page/galleries.dart';
import 'package:hitomi_search_plus/page/history.dart';
import 'package:hitomi_search_plus/server/query.dart';
import 'package:hitomi_search_plus/tools/suger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchScreen extends HookConsumerWidget {
  final SearchBuilder? initialSearchBuilder;
  const SearchScreen({super.key, this.initialSearchBuilder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = useState<SearchBuilder?>(initialSearchBuilder);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Search'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              context.push(HistoryScreen(onSelect: (query) {
                value.value = query;
              }));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SearchWidget(
          initialSearchBuilder: value.value,
          onSubmitted: (query) {
            ref.read(historyProvider.notifier).add(query);
            context.push(GalleriesResult(query: query));
          },
        ),
      ),
    );
  }
}

class SearchScreenWiget extends HookConsumerWidget {
  const SearchScreenWiget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = useState<SearchBuilder?>(null);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.history),
                onPressed: () {
                  context.push(HistoryScreen(onSelect: (query) {
                    value.value = query;
                  }));
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: SearchWidget(
              initialSearchBuilder: value.value,
              onSubmitted: (query) {
                ref.read(historyProvider.notifier).add(query);
                context.push(GalleriesResult(query: query));
              },
            ),
          ),
        ],
      ),
    );
  }
}