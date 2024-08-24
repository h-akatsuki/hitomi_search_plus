import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hitomi_search_plus/component/chip.dart';
import 'package:hitomi_search_plus/component/like.dart';
import 'package:hitomi_search_plus/db/kv.dart';
import 'package:hitomi_search_plus/db/small_image.dart';
import 'package:hitomi_search_plus/db/tasks.dart';
import 'package:hitomi_search_plus/hitomi/gallery.dart';
import 'package:hitomi_search_plus/page/gallery_detail.dart';
import 'package:hitomi_search_plus/page/online_reader.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'thumbnail.g.dart';

const key = 'useJapanese';

@Riverpod(keepAlive: true)
class UseJapanese extends _$UseJapanese {
  @override
  bool build() {
    Future(() {
      load();
    });
    return false;
  }

  Future<void> load() async {
    state = await getKVBool(key) ?? false;
  }

  Future<void> toggle() async {
    state = !state;
    await setKVBool(key, state);
  }
}

@riverpod
String autoTitle(AutoTitleRef ref, int id) {
  final gallery = ref.watch(galleryJSProvider(id));
  final useJapanese = ref.watch(useJapaneseProvider);
  return gallery.when(
    data: (value) => (value.japaneseTitle != null && useJapanese)
        ? value.japaneseTitle!
        : value.title,
    loading: () => 'Loading...',
    error: (error, _) => 'Error: $error',
  );
}

class GalleryThumbnailImage extends ConsumerWidget {
  final int width;
  final int height;
  final int id;

  const GalleryThumbnailImage({
    super.key,
    required this.id,
    this.width = 100,
    this.height = 150,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(smallImageProvider(id));
    return SizedBox(
      width: width.toDouble(),
      height: height.toDouble(),
      child: switch (image) {
        AsyncData(:final value) => Image.memory(
            value.data,
            width: width.toDouble(),
            height: height.toDouble(),
            fit: BoxFit.cover,
            errorBuilder: (context, error, _) =>
                _buildErrorWidget(context, error.toString()),
          ),
        AsyncError(:final error) =>
          _buildErrorWidget(context, error.toString()),
        _ => _buildLoadingWidget(context),
      },
    );
  }

  Widget _buildErrorWidget(BuildContext context, String errorMessage) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: colorScheme.errorContainer,
      child: Center(
        child: Text(
          'Error: $errorMessage',
          style: TextStyle(color: colorScheme.onErrorContainer),
        ),
      ),
    );
  }

  Widget _buildLoadingWidget(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: colorScheme.surfaceContainerHighest,
      child: Center(
        child: CircularProgressIndicator(
          color: colorScheme.secondary,
        ),
      ),
    );
  }
}

class Tags extends StatelessWidget {
  final List<Tag> tags;
  const Tags({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            colorScheme.surface,
            colorScheme.surface,
            colorScheme.surface.withOpacity(0.0),
          ],
          stops: const [0.0, 0.85, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: SizedBox(
        height: 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tags.length,
          itemBuilder: (context, index) {
            final tag = tags[index];
            return CompactChip(
              text: tag.tag,
              icon: tag.icon(),
              onTap: () {
                final String text;
                if (tag.female) {
                  text = "female:'${tag.tag}'";
                } else if (tag.male) {
                  text = "male:'${tag.tag}'";
                } else {
                  text = "tag:'${tag.tag}'";
                }
                Clipboard.setData(ClipboardData(text: text));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Copied to clipboard: $text',
                        style: TextStyle(color: colorScheme.onTertiary)),
                    backgroundColor: colorScheme.tertiary,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class DownloadProgressIndicator extends ConsumerWidget {
  final int galleryId;

  const DownloadProgressIndicator({super.key, required this.galleryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final download = ref.watch(
        tasksProvider(galleryId).select((value) => value.value?.progress ?? 0));
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
      child: SizedBox(
        height: 5,
        child: LinearProgressIndicator(
          value: download,
          backgroundColor: colorScheme.surfaceContainerHighest,
          valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
        ),
      ),
    );
  }
}

class GalleryListItem extends StatelessWidget {
  final Gallery gallery;
  const GalleryListItem({super.key, required this.gallery});

  String formatAuthors(List<Artist> artists, List<Group> groups) {
    final len = artists.length + groups.length;
    if (len <= 3) {
      return 'by ${artists.map((e) => e.artist).followedBy(groups.map((e) => e.group)).join(", ")}';
    } else {
      return 'by ${artists.map((e) => e.artist).followedBy(groups.map((e) => e.group)).take(3).join(", ")},...';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: GalleryThumbnailImage(
                    id: gallery.id, width: 105, height: 160),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: DownloadProgressIndicator(galleryId: gallery.id),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: GalleryTitle(gallery: gallery),
                    ),
                    LikeButton(id: gallery.id),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  formatAuthors(gallery.artists, gallery.groups),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '${gallery.language ?? "N/A"} • ${gallery.files.length} pages',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 8),
                Tags(tags: gallery.tags),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GalleryTitle extends ConsumerWidget {
  final Gallery gallery;

  const GalleryTitle({super.key, required this.gallery});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final useJapanese = ref.watch(useJapaneseProvider);

    return Text(
      (gallery.japaneseTitle != null && useJapanese)
          ? gallery.japaneseTitle!
          : gallery.title,
      style: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: colorScheme.onSurface,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class GalleryThumbnail extends ConsumerWidget {
  final int id;

  const GalleryThumbnail({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gallery = ref.watch(galleryJSProvider(id));
    return switch (gallery) {
      AsyncData(:final value) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OnlineReaderPage(id: value.id),
              ),
            );
          },
          onLongPress: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => GalleryDetailPage(galleryId: value.id),
              ),
            );
          },
          onDoubleTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => GalleryDetailPage(galleryId: value.id),
              ),
            );
          },
          child: Container(
            height: 180,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child: GalleryListItem(gallery: value),
          ),
        ),
      AsyncError(:final error) => Container(
          height: 180,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          child: Center(child: Text('Error: $error')),
        ),
      _ => Container(
          height: 180,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          child: const Center(child: CircularProgressIndicator()),
        ),
    };
  }
}
