import 'package:flutter/material.dart';
import 'package:hitomi_search_plus/db/cbz.dart';
import 'package:hitomi_search_plus/db/tasks.dart';
import 'package:hitomi_search_plus/hitomi/gallery.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExportButton extends HookConsumerWidget {
  final int id;

  const ExportButton({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dir = ref.watch(downloadDirProvider);
    if (dir.value == null) return const SizedBox();
    final prog = ref.watch(tasksProvider(id).select((t) {
      if (t.value == null) return false;
      return t.value!.done == t.value!.total;
    }));
    final gallery = ref.watch(GalleryJSProvider(id));
    if (gallery.value == null) return const SizedBox();

    if (!prog) {
      return const Tooltip(
        message: 'Download is not completed',
        child: IconButton(
          onPressed: null,
          icon: Icon(Icons.file_download_off),
        ),
      );
    }

    return IconButton(
      onPressed: () async {
        await exportCBZ(dir.value!, gallery.value!);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Exported as CBZ')),
          );
        }
      },
      icon: const Icon(Icons.file_download),
      tooltip: 'Export as CBZ',
    );
  }
}
