import 'package:hitomi_search_plus/db/image.dart';
import 'package:hitomi_search_plus/db/small_image.dart';
import 'package:hitomi_search_plus/download/download.dart';
import 'package:hitomi_search_plus/download/gallery.dart';
import 'package:hitomi_search_plus/hitomi/gallery.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top.g.dart';

class ImageSmallDone extends ImageDownloadStatus {}

class TopTaskGenerator extends TaskGenerator {
  final Task task;
  bool done;
  void Function()? onDone;

  TopTaskGenerator(this.task, {this.done = false, this.onDone});

  @override
  Task? generateTask() {
    if (done) {
      return null;
    } else {
      done = true;
      onDone?.call();
      return task;
    }
  }

  @override
  int get priority => 1000;
}

@riverpod
class TopBigImageStatus extends _$TopBigImageStatus {
  @override
  ImageDownloadStatus build(int id) {
    Future(init);
    return ImageDownloadLoadingStatus();
  }

  Future<void> init() async {
    for (int i = 0; i < workerCount; i++) {
      final key = workersKeyList[i];
      if (key?.id == id && key?.page == 0) {
        state = ImageDownloadDownloading(i);
        registStrema();
        return;
      }
    }
    final has = await hasImage(ImageKey(id: id, page: 0));
    if (has) {
      state = ImageDownloadDone();
      return;
    }
    final gallery = await ref.read(galleryJSProvider(id).future);
    if (gallery.files.isEmpty) {
      state = ImageDownloadError('No image');
      return;
    }
    final file = gallery.files.first;
    final task = Task(
      id: id,
      total: gallery.files.length,
      page: 0,
      file: file,
    );
    final generator = TopTaskGenerator(task);
    generator.onDone = () {
      removeTask(generator);
    };
    addTask(generator);
    registStrema();
    downloadSignal.complete();
  }

  void registStrema() {
    final listen = updateStrem.stream.listen((update) {
      if (update.key.id == id && update.key.page == 0) {
        if (update.type == UpdateType.start) {
          state = ImageDownloadDownloading(update.workerId);
        } else if (update.type == UpdateType.done) {
          state = ImageDownloadDone();
        } else if (update.type == UpdateType.error) {
          state = ImageDownloadError(update.message ?? 'Unknown error');
        }
      }
    });
    ref.onDispose(() {
      listen.cancel();
    });
  }
}

@riverpod
ImageDownloadStatus topImageStatus(TopImageStatusRef ref, int id) {
  final status = ref.watch(topBigImageStatusProvider(id));
  final small = ref.watch(smallImageProvider(id));
  if (status is ImageDownloadDone ||
      status is ImageDownloadError ||
      status is ImageDownloadLoadingStatus) {
    return status;
  }
  return switch (small) {
    AsyncData() => ImageSmallDone(),
    AsyncError(:final error) => ImageDownloadError(error.toString()),
    _ => ImageDownloadLoadingStatus(),
  };
}
