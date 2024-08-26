import 'package:flutter/material.dart';
import 'package:hitomi_search_plus/pages/home/page.dart';
import 'package:hitomi_search_plus/pages/like/page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'root.g.dart';

enum PageType {
  home,
  like,
}

@riverpod
class PageState extends _$PageState {
  @override
  PageType build() {
    return PageType.home;
  }

  void like() {
    state = PageType.like;
  }

  void home() {
    state = PageType.home;
  }
}

class Root extends ConsumerWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(pageStateProvider);
    return Navigator(
      pages: [
        HomePage.page(),
        if (page == PageType.like) LikePage.page(),
      ],
      onDidRemovePage: (p) {
        debugPrint('onDidRemovePage: $p');
        if (page != PageType.home) {
          ref.read(pageStateProvider.notifier).home();
        } else {
          //ref.read(pageStateProvider.notifier).like();
        }
      },
    );
  }
}
