import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hitomi_search_plus/component/bookmark.dart';
import 'package:hitomi_search_plus/component/drawer.dart';
import 'package:hitomi_search_plus/component/like.dart';
import 'package:hitomi_search_plus/page/search.dart';
import 'package:hitomi_search_plus/server/update.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

bool show = true;

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final selectedIndex = useState(0);

    useEffect(() {
      if (!show || !Platform.isWindows) {
        return;
      }
      Future(() async {
        final can =
            await ref.read(latestVersionProvider.notifier).isUpdateAvailable();
        show = false;
        if (can) {
          UpdateManager.launchUpdaterAndExit(
              context, await ref.read(latestVersionProvider.future));
        }
      });
      return null;
    }, []);

    useEffect(() {
      pageController.addListener(() {
        final newIndex = pageController.page?.round() ?? 0;
        if (newIndex != selectedIndex.value) {
          selectedIndex.value = newIndex;
        }
      });
      return null;
    }, [pageController]);

    return AdaptiveScaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: [
            _buildLazyPage(0, selectedIndex.value),
            _buildLazyPage(1, selectedIndex.value),
            _buildLazyPage(2, selectedIndex.value),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex.value,
        onDestinationSelected: (index) {
          selectedIndex.value = index;
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.bookmark_outline),
            selectedIcon: Icon(Icons.bookmark),
            label: 'Bookmarks',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite),
            label: 'Likes',
          ),
        ],
      ),
      //drawer: const CustomDrawer(),
    );
  }

  Widget _buildLazyPage(int pageIndex, int selectedIndex) {
    // Only build the page if it's the selected page or adjacent to it
    if ((pageIndex - selectedIndex).abs() <= 1) {
      switch (pageIndex) {
        case 0:
          return const Column(
            children: [
              SizedBox(height: 16),
              UpdateStatusBar(),
              Expanded(child: BookmarkList()),
            ],
          );
        case 1:
          return const SearchScreenWiget();
        case 2:
          return const Likes();
        default:
          return const SizedBox.shrink();
      }
    } else {
      // Return an empty container for pages that are not adjacent to the current page
      return const SizedBox.shrink();
    }
  }
}
