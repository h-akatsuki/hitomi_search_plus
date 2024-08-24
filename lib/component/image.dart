import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hitomi_search_plus/db/image.dart';
import 'package:hitomi_search_plus/db/small_image.dart';
import 'package:hitomi_search_plus/download/download.dart';
import 'package:hitomi_search_plus/download/gallery.dart';
import 'package:hitomi_search_plus/download/top.dart';
import 'package:hitomi_search_plus/page/online_reader.dart';
import 'package:hitomi_search_plus/tools/suger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoadingImage extends HookWidget {
  const LoadingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class DBImage extends StatelessWidget {
  final ImageKey imageKey;
  final BoxFit fit;

  const DBImage({super.key, required this.imageKey, required this.fit});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ImageItem?>(
      future: getImage(imageKey),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return ErrorImage(message: snapshot.error.toString());
        } else if (snapshot.hasData && snapshot.data != null) {
          return Image.memory(snapshot.data!.data, fit: fit);
        } else {
          return const ErrorImage(message: 'No image');
        }
      },
    );
  }
}

class ProgressImage extends StatelessWidget {
  final Stream<double> stream;

  const ProgressImage({super.key, required this.stream});

  @override
  Widget build(BuildContext context) {
    double max = 0;
    return StreamBuilder<double>(
      stream: stream,
      initialData: 0.0,
      builder: (context, snapshot) {
        double value = (snapshot.data ?? 0);
        if (value > max) {
          max = value;
        } else {
          value = max;
        }
        return Center(
          child: CircularProgressIndicator(
            value: value,
          ),
        );
      },
    );
  }
}

class GalleryImage extends ConsumerWidget {
  final ImageKey imageKey;
  final BoxFit fit;
  const GalleryImage(
      {super.key, required this.imageKey, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(imageDownloadStatusProvider(imageKey));
    if (status is ImageDownloadDone) {
      return DBImage(imageKey: imageKey, fit: fit);
    } else if (status is ImageDownloadDownloading) {
      return ProgressImage(stream: status.stream);
    } else if (status is ImageDownloadError) {
      return ErrorImage(message: status.message);
    }
    return const LoadingImage();
  }
}

class LockInteractiveViewer extends ConsumerWidget {
  final Widget child;

  const LockInteractiveViewer({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canEdit = ref.watch(canEditProvider);

    return InteractiveViewer(
      scaleEnabled: canEdit,
      minScale: 1,
      maxScale: 10,
      child: child,
    );
  }
}

class DBImageViewLock extends StatelessWidget {
  final ImageKey imageKey;
  final BoxFit fit;
  final Alignment alignment;

  const DBImageViewLock(
      {super.key,
      required this.imageKey,
      required this.fit,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ImageItem?>(
      future: getImage(imageKey),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return ErrorImage(message: snapshot.error.toString());
        } else if (snapshot.hasData && snapshot.data != null) {
          return LockInteractiveViewer(
            child: Image.memory(snapshot.data!.data,
                fit: fit, alignment: alignment),
          );
        } else {
          return const ErrorImage(message: 'No image');
        }
      },
    );
  }
}

class DBImageView extends StatelessWidget {
  final ImageKey imageKey;
  final BoxFit fit;
  final Alignment alignment;

  const DBImageView(
      {super.key,
      required this.imageKey,
      required this.fit,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ImageItem?>(
      future: getImage(imageKey),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return ErrorImage(message: snapshot.error.toString());
        } else if (snapshot.hasData && snapshot.data != null) {
          return InteractiveViewer(
            minScale: 1,
            maxScale: 10,
            child: Image.memory(snapshot.data!.data,
                fit: fit, alignment: alignment),
          );
        } else {
          return const ErrorImage(message: 'No image');
        }
      },
    );
  }
}

class GalleryImageViewLock extends ConsumerWidget {
  final ImageKey imageKey;
  final BoxFit fit;
  final Alignment alignment;
  final Function? onTap;
  const GalleryImageViewLock(
      {super.key,
      required this.imageKey,
      this.fit = BoxFit.contain,
      this.alignment = Alignment.center,
      this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(imageDownloadStatusProvider(imageKey));

    Widget child;
    if (status is ImageDownloadDone) {
      child =
          DBImageViewLock(imageKey: imageKey, fit: fit, alignment: alignment);
    } else if (status is ImageDownloadDownloading) {
      child = ProgressImage(stream: status.stream);
    } else if (status is ImageDownloadError) {
      child = ErrorImage(message: status.message);
    } else {
      child = const LoadingImage();
    }

    return GestureDetector(
      onTap: onTap != null ? () => onTap!() : null,
      child: child,
    );
  }
}

class GalleryImageView extends ConsumerWidget {
  final ImageKey imageKey;
  final BoxFit fit;
  final Alignment alignment;
  final Function? onTap;
  const GalleryImageView(
      {super.key,
      required this.imageKey,
      this.fit = BoxFit.contain,
      this.alignment = Alignment.center,
      this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(imageDownloadStatusProvider(imageKey));

    Widget child;
    if (status is ImageDownloadDone) {
      child = DBImageView(imageKey: imageKey, fit: fit, alignment: alignment);
    } else if (status is ImageDownloadDownloading) {
      child = ProgressImage(stream: status.stream);
    } else if (status is ImageDownloadError) {
      child = ErrorImage(message: status.message);
    } else {
      child = const LoadingImage();
    }

    return GestureDetector(
      onTap: onTap != null ? () => onTap!() : null,
      child: child,
    );
  }
}

class ErrorImage extends StatelessWidget {
  final String message;
  const ErrorImage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.colorScheme.errorContainer,
      child: Center(
        child: Text(
          'Error: $message',
          style: TextStyle(color: context.theme.colorScheme.onErrorContainer),
        ),
      ),
    );
  }
}

class SmallImage extends ConsumerWidget {
  final int id;
  const SmallImage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(smallImageProvider(id));
    return switch (image) {
      AsyncData(:final value) => Image.memory(
          value.data,
          width: 100,
          height: 150,
          fit: BoxFit.cover,
          errorBuilder: (context, error, _) =>
              Center(child: Text('Error: $error')),
        ),
      AsyncError(:final error) => ErrorImage(message: error.toString()),
      _ => const LoadingImage(),
    };
  }
}

class GalleryTopImage extends ConsumerWidget {
  final int id;
  const GalleryTopImage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(topImageStatusProvider(id));
    if (image is ImageDownloadDone) {
      return GalleryImage(imageKey: ImageKey(id: id, page: 0));
    } else if (image is ImageDownloadDownloading) {
      return ProgressImage(stream: image.stream);
    } else if (image is ImageDownloadError) {
      return ErrorImage(message: image.message);
    } else if (image is ImageSmallDone) {
      return SmallImage(id: id);
    }
    return const LoadingImage();
  }
}
