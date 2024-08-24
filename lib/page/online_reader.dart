import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hitomi_search_plus/component/custom_list.dart';
import 'package:hitomi_search_plus/component/drawer.dart';
import 'package:hitomi_search_plus/component/image.dart';
import 'package:hitomi_search_plus/component/jump_fab.dart';
import 'package:hitomi_search_plus/component/like.dart';
import 'package:hitomi_search_plus/component/thumbnail.dart';
import 'package:hitomi_search_plus/download/download.dart';
import 'package:hitomi_search_plus/download/view.dart';
import 'package:hitomi_search_plus/hitomi/gallery.dart';
import 'package:hitomi_search_plus/page/fullscreen_reader.dart';
import 'package:hitomi_search_plus/page/gallery_detail.dart';
import 'package:hitomi_search_plus/tools/hook.dart';
import 'package:hitomi_search_plus/tools/suger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'online_reader.g.dart';

@Riverpod(keepAlive: true)
class CanEdit extends _$CanEdit {
  @override
  bool build() {
    return false;
  }

  void set(bool value) {
    state = value;
  }
}

class TestPage extends HookConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canEdit = ref.watch(canEditProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Center(
        child: Text(canEdit.toString()),
      ),
    );
  }
}

class OnlineReader extends HookConsumerWidget {
  final Gallery gallery;
  final CustomListViewController controller;

  const OnlineReader(
      {super.key, required this.gallery, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(viewDownloaderProvider(gallery.id).select((_) => null));
    useEffect(() {
      final set = ref.read(viewDownloaderProvider(gallery.id).notifier).setPage;
      final listen = controller.currentPage.listen((page) {
        set(page);
      });
      return listen.cancel;
    }, []);
    final isMouse = ref.watch(isMouseDeviceProvider);
    if (isMouse) {
      return FocusScope(
        autofocus: true,
        onKeyEvent: (node, value) {
          if (value.logicalKey == LogicalKeyboardKey.controlLeft ||
              value.logicalKey == LogicalKeyboardKey.controlRight) {
            if (value is KeyDownEvent) {
              ref.read(canEditProvider.notifier).set(true);
            } else if (value is! KeyRepeatEvent) {
              ref.read(canEditProvider.notifier).set(false);
            }
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: CustomListViewForReaderLock(
          itemCount: gallery.files.length,
          itemHeight: (width, height, index) {
            final item = gallery.files[index];
            if (width > height) {
              return height;
            } else {
              return width / item.width * item.height;
            }
          },
          itemBuilder: (context, index) {
            return GalleryImageViewLock(
                imageKey: ImageKey(id: gallery.id, page: index),
                onTap: () {
                  context.push(FullscreenReader(
                    id: gallery.id,
                    initialPage: index,
                    onDone: (page) {
                      controller.jump(page);
                    },
                  ));
                });
          },
          controller: controller,
        ),
      );
    } else {
      return CustomListViewForReader(
        itemCount: gallery.files.length,
        itemHeight: (width, height, index) {
          final item = gallery.files[index];
          if (width > height) {
            return height;
          } else {
            return width / item.width * item.height;
          }
        },
        itemBuilder: (context, index) {
          return GalleryImageView(
            imageKey: ImageKey(id: gallery.id, page: index),
          );
        },
        controller: controller,
      );
    }
  }
}

class OnlineReaderPage extends HookConsumerWidget {
  final int id;

  const OnlineReaderPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gallery = ref.watch(galleryJSProvider(id));
    final title = ref.read(autoTitleProvider(id));
    final controller = useCustomListViewController();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          LikeButton(id: id),
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    GalleryDetailPageFromReader(galleryId: id),
              ));
            },
          ),
        ],
      ),
      body: gallery.when(
        data: (gallery) =>
            OnlineReader(gallery: gallery, controller: controller),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
      ),
      floatingActionButton: gallery.hasValue
          ? PageJumpWidget(
              initialIndex: 0,
              pageStream: controller.currentPage,
              total: gallery.value!.files.length,
              onJump: controller.jump,
            )
          : null,
    );
  }
}
