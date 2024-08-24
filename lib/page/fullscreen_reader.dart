import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fullscreen_window/fullscreen_window.dart';
import 'package:hitomi_search_plus/component/drawer.dart';
import 'package:hitomi_search_plus/component/image.dart';
import 'package:hitomi_search_plus/component/thumbnail.dart';
import 'package:hitomi_search_plus/db/kv.dart';
import 'package:hitomi_search_plus/download/download.dart';
import 'package:hitomi_search_plus/download/view.dart';
import 'package:hitomi_search_plus/hitomi/gallery.dart';
import 'package:hitomi_search_plus/page/online_reader.dart';
import 'package:hitomi_search_plus/tools/hook.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fullscreen_reader.g.dart';

@Riverpod(keepAlive: true)
class ChangeFullscreen extends _$ChangeFullscreen {
  @override
  bool build() {
    return false;
  }

  void set(bool value) {
    state = value;
    FullScreenWindow.setFullScreen(value);
  }

  void toggle() {
    state = !state;
    FullScreenWindow.setFullScreen(state);
  }
}

abstract class DisplayPage {
  @override
  String toString() {
    return 'DisplayPage';
  }
}

class SinglePage extends DisplayPage {
  final int page;
  SinglePage(this.page);

  @override
  String toString() {
    return 'SinglePage($page)';
  }
}

class DoublePage extends DisplayPage {
  final int page1;
  final int page2;
  DoublePage(this.page1, this.page2);

  @override
  String toString() {
    return 'DoublePage($page1, $page2)';
  }
}

enum ViewModeState {
  single,
  double,
  doublePlusOne;

  int totalPage(int total) {
    return switch (this) {
      ViewModeState.single => total,
      ViewModeState.double => (total / 2).ceil(),
      ViewModeState.doublePlusOne => ((total + 1) / 2).ceil(),
    };
  }

  DisplayPage displayPage(int page, int totalPage) {
    if (this == ViewModeState.single) {
      return SinglePage(page);
    }
    if (this == ViewModeState.double) {
      if ((page * 2 + 1) >= totalPage) {
        return SinglePage(page * 2);
      }
      return DoublePage(page * 2, page * 2 + 1);
    }
    if (page == 0) {
      return SinglePage(0);
    }
    if ((page * 2) >= totalPage) {
      return SinglePage(page * 2 - 1);
    }
    return DoublePage(page * 2 - 1, page * 2);
  }

  int page(int index) {
    if (this == ViewModeState.single) {
      return index;
    }
    if (this == ViewModeState.double) {
      return index ~/ 2;
    }
    return (index + 1) ~/ 2;
  }

  int toIndex(int page) {
    if (this == ViewModeState.single) {
      return page;
    }
    if (this == ViewModeState.double) {
      return page * 2;
    }
    if (page == 0) {
      return 0;
    }
    return page * 2 - 1;
  }
}

const _key = 'viewMode';

@Riverpod(keepAlive: true)
class ViewMode extends _$ViewMode {
  @override
  ViewModeState build() {
    Future(() => load());
    return ViewModeState.single;
  }

  Future<void> load() async {
    final mode = await getKV(_key);
    if (mode != null) {
      state = ViewModeState.values[int.parse(mode)];
    }
  }

  void save() {
    setKV(_key, state.index.toString());
  }

  void toggle() {
    state =
        ViewModeState.values[(state.index + 1) % ViewModeState.values.length];
    save();
  }
}

const _headerHeight = 48.0;

class FullscreenReader extends ConsumerWidget {
  final int id;
  final int? initialPage;
  final Function(int page)? onDone;
  const FullscreenReader(
      {super.key, required this.id, this.initialPage, this.onDone});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gallery = ref.watch(galleryJSProvider(id));
    final title = ref.watch(autoTitleProvider(id));
    return switch (gallery) {
      AsyncData(:final value) => FullscreenReaderInner(
          initialPage: initialPage,
          gallery: value,
          title: title,
          onDone: onDone,
        ),
      AsyncError(:final error) => Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: Center(
            child: Text('Error: $error'),
          ),
        ),
      _ => Scaffold(
          appBar: AppBar(
            title: const Text('Loading'),
          ),
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        )
    };
  }
}

class FullscreenReaderInner extends HookConsumerWidget {
  final int? initialPage;
  final Gallery gallery;
  final String title;
  final Function(int page)? onDone;
  const FullscreenReaderInner(
      {super.key,
      this.initialPage,
      required this.gallery,
      this.title = '',
      this.onDone});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageStream = useStreamController<int>();
    final mode = ref.watch(viewModeProvider);
    final isMouse = ref.watch(isMouseDeviceProvider);
    final init = useMemoized(() => WrapObject(true));
    final disable = useMemoized(() => WrapObject(false));
    final last = useMemoized(() => WrapObject(0));
    final set = useMemoized(
        () => ref.read(viewDownloaderProvider(gallery.id).notifier).setPage);
    final controller =
        usePageController(initialPage: mode.page(initialPage ?? 0));
    final toggle = useStreamController<int>();
    useEffect(() {
      if (init.value) {
        init.value = false;
      } else {
        disable.value = true;
        controller.jumpToPage(mode.page(last.value));
      }
      listen() {
        if (disable.value) {
          disable.value = false;
          return;
        }
        final page = mode.toIndex(controller.page!.round());
        if (page == last.value) {
          return;
        }
        pageStream.add(page);
        last.value = page;
        set(page);
      }

      controller.addListener(listen);
      return () => controller.removeListener(listen);
    }, [mode]);

    final top = ReaderHeader(
      title: title,
      page: pageStream.stream,
      totalPage: gallery.files.length,
      jumpToPage: (page) {
        final index = mode.page(page);
        controller.jumpToPage(index);
      },
    );

    final body = GestureDetector(
      onDoubleTap: () {
        ref.read(changeFullscreenProvider.notifier).toggle();
      },
      onTap: () {
        toggle.add(0);
      },
      child: Listener(
        onPointerSignal: (event) {
          if (ref.read(canEditProvider)) {
            return;
          }
          if (event is PointerScrollEvent) {
            if (event.scrollDelta.dy > 0) {
              if (controller.page!.round() ==
                  mode.totalPage(gallery.files.length) - 1) {
                Navigator.pop(context);
              }
              controller.nextPage(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
              );
            } else {
              controller.previousPage(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
              );
            }
          }
        },
        child: Stack(
          children: [
            PageView.builder(
              reverse: true,
              controller: controller,
              itemCount: mode.totalPage(gallery.files.length),
              itemBuilder: (context, index) {
                final page = mode.displayPage(index, gallery.files.length);
                return switch (page) {
                  SinglePage(:final page) =>
                    SingleImage(imageKey: ImageKey(id: gallery.id, page: page)),
                  DoublePage(:final page1, :final page2) => DoubleImage(
                      imageKey1: ImageKey(id: gallery.id, page: page1),
                      imageKey2: ImageKey(id: gallery.id, page: page2)),
                  _ => const Center(child: Text('Error')),
                };
              },
            ),
            AnimateonHeader(head: top, toggle: toggle.stream),
          ],
        ),
      ),
    );
    if (!isMouse) {
      return PopScope(
        onPopInvokedWithResult: (didPop, result) {
          onDone?.call(mode.toIndex(controller.page!.round()));
          ref.read(changeFullscreenProvider.notifier).set(false);
        },
        child: Scaffold(
          body: body,
        ),
      );
    } else {
      return PopScope(
        onPopInvokedWithResult: (didPop, result) {
          onDone?.call(mode.toIndex(controller.page!.round()));
          ref.read(changeFullscreenProvider.notifier).set(false);
        },
        child: Scaffold(
          body: FocusScope(
            autofocus: true,
            onKeyEvent: (_, value) {
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
            child: body,
          ),
        ),
      );
    }
  }
}

class AnimateonHeader extends HookConsumerWidget {
  final Widget head;
  final Stream<int> toggle;
  const AnimateonHeader({super.key, required this.head, required this.toggle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHeaderVisible = useState(false);
    useEffect(() {
      final sub = toggle.listen((_) {
        isHeaderVisible.value = !isHeaderVisible.value;
      });
      return sub.cancel;
    }, []);
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      top: isHeaderVisible.value ? 0 : -_headerHeight,
      left: 0,
      right: 0,
      height: _headerHeight,
      child: head,
    );
  }
}

class ReaderHeader extends StatelessWidget {
  final String title;
  final Stream<int> page;
  final int totalPage;
  final Function(int page) jumpToPage;

  const ReaderHeader({
    super.key,
    required this.title,
    required this.page,
    required this.totalPage,
    required this.jumpToPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _headerHeight,
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 16),
          StreamBuilder<int>(
            stream: page,
            builder: (context, snapshot) {
              final currentPage = snapshot.data ?? 0;
              return TextButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => JumpDialog(
                    totalPage: totalPage,
                    jumpToPage: jumpToPage,
                  ),
                ),
                child: Text(
                  '${currentPage + 1} / $totalPage',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              );
            },
          ),
          const SizedBox(width: 8),
          const ToggleViewModeButton(),
        ],
      ),
    );
  }
}

class JumpDialog extends HookWidget {
  final int totalPage;
  final Function(int page) jumpToPage;

  const JumpDialog({
    super.key,
    required this.totalPage,
    required this.jumpToPage,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    return AlertDialog(
      title: const Text('Jump to Page'),
      content: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Page',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (text) {
                final page = int.tryParse(text);
                if (page != null && page > 0 && page <= totalPage) {
                  jumpToPage(page - 1);
                  Navigator.pop(context);
                }
              },
            ),
          ),
          const SizedBox(width: 8),
          Text(' / $totalPage', style: const TextStyle(fontSize: 16)),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final page = int.tryParse(controller.text);
            if (page != null && page > 0 && page <= totalPage) {
              jumpToPage(page - 1);
              Navigator.pop(context);
            }
          },
          child: const Text('Jump'),
        ),
      ],
    );
  }
}

class ImageViewKey {
  final ImageKey imageKey;

  const ImageViewKey(this.imageKey);

  @override
  bool operator ==(Object other) {
    return other is ImageViewKey && other.imageKey == imageKey;
  }

  @override
  int get hashCode => imageKey.hashCode;
}

class SingleImage extends ConsumerWidget {
  final ImageKey imageKey;

  const SingleImage({super.key, required this.imageKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMouse = ref.watch(isMouseDeviceProvider);
    if (isMouse) {
      return GalleryImageViewLock(imageKey: imageKey, key: ValueKey(imageKey));
    } else {
      return GalleryImageView(imageKey: imageKey, key: ValueKey(imageKey));
    }
  }
}

class DoubleImage extends ConsumerWidget {
  final ImageKey imageKey1;
  final ImageKey imageKey2;

  const DoubleImage(
      {super.key, required this.imageKey1, required this.imageKey2});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMouse = ref.watch(isMouseDeviceProvider);
    if (isMouse) {
      return Row(
        children: [
          Expanded(
            child: GalleryImageViewLock(
                imageKey: imageKey2,
                key: ValueKey(imageKey2),
                alignment: Alignment.centerRight),
          ),
          const VerticalDivider(width: 5),
          Expanded(
            child: GalleryImageViewLock(
                imageKey: imageKey1,
                key: ValueKey(imageKey1),
                alignment: Alignment.centerLeft),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: GalleryImageView(
                imageKey: imageKey2,
                key: ValueKey(imageKey2),
                alignment: Alignment.centerRight),
          ),
          const VerticalDivider(width: 5),
          Expanded(
            child: GalleryImageView(
                imageKey: imageKey1,
                key: ValueKey(imageKey1),
                alignment: Alignment.centerLeft),
          ),
        ],
      );
    }
  }
}

class ToggleViewModeButton extends HookConsumerWidget {
  const ToggleViewModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(viewModeProvider);
    return IconButton(
      icon: Icon(
        mode == ViewModeState.single
            ? Icons.square
            : mode == ViewModeState.double
                ? Icons.view_column
                : Icons.view_carousel,
      ),
      onPressed: () {
        ref.read(viewModeProvider.notifier).toggle();
      },
    );
  }
}
