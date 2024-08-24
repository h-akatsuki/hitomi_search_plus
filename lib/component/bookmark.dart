import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hitomi_search_plus/component/thumbnail.dart';
import 'package:hitomi_search_plus/db/bookmark.dart';
import 'package:hitomi_search_plus/hitomi/gallery.dart';
import 'package:hitomi_search_plus/page/bookmark_galleries.dart';
import 'package:hitomi_search_plus/page/edit_bookmark.dart';
import 'package:hitomi_search_plus/page/galleries.dart';
import 'package:hitomi_search_plus/server/query.dart';
import 'package:hitomi_search_plus/tools/suger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookmarkIcon extends ConsumerWidget {
  final SearchBuilder query;

  const BookmarkIcon({super.key, required this.query});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmark = ref.watch(bookmarkedProvider(query.query));
    return IconButton(
      icon: Icon(bookmark != null ? Icons.bookmark : Icons.bookmark_border),
      onPressed: () {
        if (bookmark == null) {
          ref.read(bookmarkProvider.notifier).add(query);
        } else {
          ref.read(bookmarkProvider.notifier).remove(bookmark);
        }
      },
    );
  }
}

class UpdaterIcon extends HookConsumerWidget {
  const UpdaterIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updaterState = ref.watch(updateingBookmarkProvider);
    final animationController = useAnimationController(
      duration: const Duration(seconds: 2),
      vsync: useSingleTickerProvider(),
    );

    useEffect(() {
      if (updaterState == UpdaterState.updating) {
        animationController.repeat();
      } else {
        animationController.stop();
        animationController.reset();
      }
      return null;
    }, [updaterState]);

    IconData iconData;
    Color iconColor;
    bool isClickable;

    final colorScheme = Theme.of(context).colorScheme;
    switch (updaterState) {
      case UpdaterState.idle:
        iconData = Icons.refresh;
        iconColor = colorScheme.primary;
        isClickable = true;
        break;
      case UpdaterState.updating:
        iconData = Icons.refresh;
        iconColor = colorScheme.secondary;
        isClickable = false;
        break;
      case UpdaterState.error:
        iconData = Icons.error;
        iconColor = colorScheme.error;
        isClickable = true;
        break;
    }
    onPressed() {
      ref.read(bookmarkProvider.notifier).update();
    }

    return GestureDetector(
      onTap: isClickable ? onPressed : null,
      child: RotationTransition(
        turns: animationController,
        child: Icon(
          iconData,
          color: iconColor,
          size: 30,
        ),
      ),
    );
  }
}

class UpdateStatusBar extends HookConsumerWidget {
  const UpdateStatusBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastUpdate = ref.watch(bookmarkLastUpdateProvider);
    return Row(
      children: [
        const SizedBox(width: 16),
        const UpdaterIcon(),
        const SizedBox(width: 8),
        Text('Last update: $lastUpdate'),
      ],
    );
  }
}

class BookmarkItemSwitch extends ConsumerWidget {
  final BookmarkItem item;
  final VoidCallback onEdit;
  final VoidCallback onPressed;

  const BookmarkItemSwitch({
    super.key,
    required this.item,
    required this.onEdit,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget child;
    if (item.inner is BookmarkSuccess) {
      child = BookmarkNormalItem(item: item, onEdit: onEdit);
    } else {
      child = BookmarkErrorItem(item: item, onEdit: onEdit);
    }

    return InkWell(
      onTap: onPressed,
      child: child,
    );
  }
}

class BookmarkNormalItem extends ConsumerWidget {
  final BookmarkItem item;
  final VoidCallback onEdit;

  const BookmarkNormalItem({
    super.key,
    required this.item,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inner = item.inner as BookmarkSuccess;
    if (inner.count == 0) {
      return BookmarkEmptyItem(
        title: item.title ?? queryToTitle(item.searchBuilder.query),
        onEdit: onEdit,
      );
    }
    final gallery = ref.watch(galleryJSProvider(inner.newestGalleryId!));
    return ListTile(
      leading: GalleryThumbnailImage(
          id: inner.newestGalleryId!, width: 50, height: 50),
      title: Text(item.title ?? queryToTitle(item.searchBuilder.query)),
      subtitle: Text(
        gallery.hasValue
            ? 'Last updated: ${gallery.value!.localDateStr()}'
            : 'Loading...',
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${inner.count} items'),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: onEdit,
          ),
        ],
      ),
    );
  }
}

class BookmarkErrorItem extends StatelessWidget {
  final BookmarkItem item;
  final VoidCallback onEdit;

  const BookmarkErrorItem({
    super.key,
    required this.item,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final inner = item.inner as BookmarkError;
    return ListTile(
      title: Text(item.title ?? queryToTitle(item.searchBuilder.query)),
      subtitle: Text(
        'Error: ${inner.error}',
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: onEdit,
      ),
    );
  }
}

class BookmarkEmptyItem extends StatelessWidget {
  final String title;
  final VoidCallback onEdit;

  const BookmarkEmptyItem({
    super.key,
    required this.title,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: const Text(
        'This list is empty',
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: onEdit,
      ),
    );
  }
}

class BookmarkList extends ConsumerWidget {
  const BookmarkList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarks = ref.watch(bookmarkProvider);

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(bookmarkProvider.notifier).update();
      },
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: bookmarks.length + 1,
        itemBuilder: (context, index) {
          if (index == bookmarks.length) {
            return Container(
              height: 50,
              alignment: Alignment.center,
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  context.push(const BookmarkCreateScreen());
                },
              ),
            );
          }
          final item = bookmarks[index];
          return BookmarkItemSwitch(
            item: item,
            onEdit: () {
              context.push(
                BookmarkEditScreen(id: item.id),
              );
            },
            onPressed: () {
              context.push(
                BookmarkGalleries(id: item.id),
              );
            },
          );
        },
      ),
    );
  }
}
