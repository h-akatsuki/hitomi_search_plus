import 'package:flutter/material.dart';
import 'package:hitomi_search_plus/root.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LikePage extends ConsumerWidget {
  const LikePage({super.key});

  static Page page() => const MaterialPage(child: LikePage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Like'),
      ),
      body: TextButton(
        onPressed: () {
          ref.read(pageStateProvider.notifier).home();
        },
        child: const Text('Home'),
      ),
    );
  }
}
