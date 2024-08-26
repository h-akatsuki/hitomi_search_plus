import 'package:flutter/material.dart';
import 'package:hitomi_search_plus/root.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static Page page() => const MaterialPage(child: HomePage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Column(
      children: [
        const Text('Hello World'),
        IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: () {
            ref.read(pageStateProvider.notifier).like();
          },
        ),
      ],
    ));
  }
}
