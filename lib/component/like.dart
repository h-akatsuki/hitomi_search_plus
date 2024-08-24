import 'package:flutter/material.dart';
import 'package:hitomi_search_plus/db/like.dart';
import 'package:hitomi_search_plus/page/galleries.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LikeButton extends ConsumerWidget {
  final int id;

  const LikeButton({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final like = ref.watch(likeProvider(id));
    return IconButton(
      icon: like
          ? Icon(Icons.favorite, color: colorScheme.primary)
          : Icon(Icons.favorite_border, color: colorScheme.primary),
      onPressed: () {
        ref.read(likeProvider(id).notifier).toggle();
      },
    );
  }
}

class Likes extends ConsumerWidget {
  const Likes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likeList = ref.watch(likeListProvider);
    return switch (likeList) {
      AsyncData(:final value) => SimpleGalleries(results: value),
      AsyncError(:final error, :final stackTrace) => Center(
          child: Column(
            children: [
              Text('Error: $error'),
              Text('Stack Trace: $stackTrace'),
            ],
          ),
        ),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}
