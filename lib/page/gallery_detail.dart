import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hitomi_search_plus/component/image.dart';
import 'package:hitomi_search_plus/component/thumbnail.dart';
import 'package:hitomi_search_plus/db/like.dart';
import 'package:hitomi_search_plus/db/tasks.dart';
import 'package:hitomi_search_plus/hitomi/gallery.dart';
import 'package:hitomi_search_plus/page/online_reader.dart';
import 'package:hitomi_search_plus/tools/url.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class GalleryDetailPage extends HookConsumerWidget {
  final int galleryId;

  const GalleryDetailPage({super.key, required this.galleryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final galleryAsyncValue = ref.watch(galleryJSProvider(galleryId));
    final title = ref.read(autoTitleProvider(galleryId));

    return Scaffold(
      appBar: AppBar(
        title: galleryAsyncValue.when(
          data: (gallery) => Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          loading: () => const Text('Loading...'),
          error: (_, __) => const Text('Error'),
        ),
        actions: [
          GalleryLinkButton(galleryId: galleryId),
        ],
      ),
      body: galleryAsyncValue.when(
        data: (gallery) => GalleryDetailBody(gallery: gallery),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}

class GalleryDetailBody extends StatelessWidget {
  final Gallery gallery;

  const GalleryDetailBody({super.key, required this.gallery});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GalleryHeader(gallery: gallery),
          GalleryActionArea(gallery: gallery),
          GalleryTagSection(gallery: gallery),
          GalleryDetailSection(gallery: gallery),
          RelatedGalleriesSection(
            gallery: gallery,
          )
        ],
      ),
    );
  }
}

class GalleryDetailPageFromReader extends HookConsumerWidget {
  final int galleryId;

  const GalleryDetailPageFromReader({super.key, required this.galleryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final galleryAsyncValue = ref.watch(galleryJSProvider(galleryId));
    final title = ref.read(autoTitleProvider(galleryId));

    return Scaffold(
      appBar: AppBar(
        title: galleryAsyncValue.when(
          data: (gallery) => Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          loading: () => const Text('Loading...'),
          error: (_, __) => const Text('Error'),
        ),
        actions: [
          GalleryLinkButton(galleryId: galleryId),
        ],
      ),
      body: galleryAsyncValue.when(
        data: (gallery) => GalleryDetailBodyFromReader(gallery: gallery),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}

class GalleryDetailBodyFromReader extends StatelessWidget {
  final Gallery gallery;

  const GalleryDetailBodyFromReader({super.key, required this.gallery});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GalleryHeader(gallery: gallery),
          GalleryActionAreaFromReader(gallery: gallery),
          GalleryTagSection(gallery: gallery),
          GalleryDetailSection(gallery: gallery),
        ],
      ),
    );
  }
}

class GalleryLinkButton extends StatelessWidget {
  final int galleryId;

  const GalleryLinkButton({super.key, required this.galleryId});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.link),
      onPressed: () {
        final url = 'https://hitomi.la/galleries/$galleryId.html';
        openLink(url);
      },
    );
  }
}

class GalleryHeader extends ConsumerWidget {
  final Gallery gallery;

  const GalleryHeader({super.key, required this.gallery});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final title = ref.read(autoTitleProvider(gallery.id));
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: AspectRatio(
                aspectRatio: 2 / 3,
                child: GalleryTopImage(id: gallery.id),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleLarge,
                  ),
                  const Spacer(),
                  _buildInfoItem(
                      context, Icons.date_range, _formatDate(gallery.date)),
                  _buildInfoItem(
                      context, Icons.image, '${gallery.files.length}'),
                  _buildInfoItem(
                      context, Icons.language, gallery.language ?? 'N/A'),
                  _buildInfoItem(context, Icons.category, gallery.type),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(BuildContext context, IconData label, String value) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(
          label,
          color: theme.colorScheme.onSurfaceVariant,
          size: theme.textTheme.bodyMedium!.fontSize,
        ),
        const SizedBox(width: 8),
        Text(
          value,
        ),
      ],
    );
  }

  String _formatDate(String dateString) {
    final date = DateTime.parse(dateString);
    return DateFormat('yyyy-MM-dd').format(date);
  }
}

class GalleryActionArea extends ConsumerWidget {
  final Gallery gallery;

  const GalleryActionArea({super.key, required this.gallery});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final isLiked = ref.watch(likeProvider(gallery.id));
    final downloadProgress = ref.watch(tasksProvider(gallery.id)
        .select((task) => task.value?.progress ?? 0.0));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                if (isLiked)
                  DownloadProgressIndicator(progress: downloadProgress),
                const SizedBox(width: 12.0),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? colorScheme.primary : null,
                    ),
                    label: Text(isLiked ? 'Liked' : 'Like'),
                    onPressed: () {
                      ref.read(likeProvider(gallery.id).notifier).toggle();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      backgroundColor:
                          isLiked ? colorScheme.primaryContainer : null,
                      foregroundColor:
                          isLiked ? colorScheme.onPrimaryContainer : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            flex: 3,
            child: FilledButton.icon(
              icon: const Icon(Icons.visibility),
              label: const Text('View'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OnlineReaderPage(id: gallery.id),
                  ),
                );
              },
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GalleryActionAreaFromReader extends ConsumerWidget {
  final Gallery gallery;

  const GalleryActionAreaFromReader({super.key, required this.gallery});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final isLiked = ref.watch(likeProvider(gallery.id));
    final downloadProgress = ref.watch(tasksProvider(gallery.id)
        .select((task) => task.value?.progress ?? 0.0));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                if (isLiked)
                  DownloadProgressIndicator(progress: downloadProgress),
                const SizedBox(width: 12.0),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? colorScheme.primary : null,
                    ),
                    label: Text(isLiked ? 'Liked' : 'Like'),
                    onPressed: () {
                      ref.read(likeProvider(gallery.id).notifier).toggle();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      backgroundColor:
                          isLiked ? colorScheme.primaryContainer : null,
                      foregroundColor:
                          isLiked ? colorScheme.onPrimaryContainer : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            flex: 3,
            child: FilledButton.icon(
              icon: const Icon(Icons.visibility),
              label: const Text('Back to Viewer'),
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DownloadProgressIndicator extends StatelessWidget {
  final double progress;

  const DownloadProgressIndicator({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: 28,
      height: 28,
      child: Stack(
        alignment: Alignment.center,
        children: [
          TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            tween: Tween(begin: 0, end: progress),
            builder: (context, value, _) {
              return CircularProgressIndicator(
                value: value,
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
                backgroundColor: colorScheme.surfaceContainerHighest,
              );
            },
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: progress >= 1.0
                ? Icon(
                    Icons.check,
                    size: 16,
                    color: colorScheme.primary,
                    key: const ValueKey('check'),
                  )
                : Icon(
                    Icons.download,
                    size: 16,
                    color: colorScheme.primary,
                    key: const ValueKey('download'),
                  ),
          ),
        ],
      ),
    );
  }
}

class GalleryTagSection extends StatelessWidget {
  final Gallery gallery;

  const GalleryTagSection({super.key, required this.gallery});

  @override
  Widget build(BuildContext context) {
    final artistsAndGroups = [
      ...gallery.artists.map((artist) =>
          TagChip(tag: artist.artist, icon: Icons.person, type: 'artist')),
      ...gallery.groups.map((group) =>
          TagChip(tag: group.group, icon: Icons.group, type: 'group')),
    ];

    final charactersAndParodies = [
      ...gallery.characters.map((character) => TagChip(
          tag: character.character, icon: Icons.face, type: 'character')),
      ...gallery.parodys.map((parody) =>
          TagChip(tag: parody.parody, icon: Icons.book, type: 'parody')),
    ];

    final tags = gallery.tags
        .map((tag) => TagChip(
            tag: tag.tag,
            icon: tag.icon(),
            type: tag.female ? 'female' : (tag.male ? 'male' : 'tag')))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (artistsAndGroups.isNotEmpty) ...[
            _buildTagGroup(context, 'Artists & Groups', artistsAndGroups),
            const SizedBox(height: 16),
          ],
          if (charactersAndParodies.isNotEmpty) ...[
            _buildTagGroup(
                context, 'Characters & Parodies', charactersAndParodies),
            const SizedBox(height: 16),
          ],
          if (tags.isNotEmpty) _buildTagGroup(context, 'Tags', tags),
        ],
      ),
    );
  }

  Widget _buildTagGroup(BuildContext context, String title, List<Widget> tags) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: tags,
        ),
      ],
    );
  }
}

class TagChip extends StatelessWidget {
  final String tag;
  final IconData icon;
  final String type;

  const TagChip(
      {super.key, required this.tag, required this.icon, required this.type});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        final text = "$type:'$tag'";
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
      child: Chip(
        avatar: Icon(icon, size: 18),
        label: Text(tag),
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}

class GalleryDetailSection extends StatelessWidget {
  final Gallery gallery;

  const GalleryDetailSection({super.key, required this.gallery});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Details',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          _buildDetailItem('Gallery ID', gallery.id.toString()),
          _buildDetailItem('File Formats', _getFileFormats()),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  String _getFileFormats() {
    final formats = <String>[];
    if (gallery.files.any((file) => file.haswebp)) formats.add('WebP');
    if (gallery.files.any((file) => file.hasavif)) formats.add('AVIF');
    if (gallery.files.any((file) => file.hasjxl)) formats.add('JXL');

    final originalFormat = gallery.files.isNotEmpty
        ? gallery.files.first.name.split('.').last.toUpperCase()
        : '';
    if (originalFormat.isNotEmpty && !formats.contains(originalFormat)) {
      formats.add(originalFormat);
    }

    return formats.isEmpty ? 'N/A' : formats.join(', ');
  }
}

class RelatedGalleriesSection extends HookConsumerWidget {
  final Gallery gallery;

  const RelatedGalleriesSection({super.key, required this.gallery});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Related Galleries',
            style: theme.textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: gallery.related.length,
            itemBuilder: (context, index) {
              final relatedId = gallery.related[index];
              return Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 4.0, bottom: 16.0),
                child: RelatedGalleryItem(galleryId: relatedId),
              );
            },
          ),
        ),
      ],
    );
  }
}

class RelatedGalleryItem extends HookConsumerWidget {
  final int galleryId;

  const RelatedGalleryItem({super.key, required this.galleryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final galleryAsyncValue = ref.watch(galleryJSProvider(galleryId));
    final colorScheme = Theme.of(context).colorScheme;

    return galleryAsyncValue.when(
      data: (relatedGallery) => Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OnlineReaderPage(id: relatedGallery.id),
              ),
            );
          },
          onLongPress: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    GalleryDetailPage(galleryId: relatedGallery.id),
              ),
            );
          },
          onDoubleTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    GalleryDetailPage(galleryId: relatedGallery.id),
              ),
            );
          },
          child: SizedBox(
            width: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: GalleryThumbnailImage(id: relatedGallery.id),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: colorScheme.surfaceContainerHighest,
                  child: Text(
                    relatedGallery.title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      loading: () => SizedBox(
        width: 120,
        child: Card(
          child: Center(
            child: CircularProgressIndicator(
              color: colorScheme.primary,
            ),
          ),
        ),
      ),
      error: (_, __) => SizedBox(
        width: 120,
        child: Card(
          child: Center(
            child: Icon(Icons.error, color: colorScheme.error),
          ),
        ),
      ),
    );
  }
}
