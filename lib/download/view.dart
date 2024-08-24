import 'package:hitomi_search_plus/download/download.dart';
import 'package:hitomi_search_plus/download/gallery.dart';
import 'package:hitomi_search_plus/hitomi/gallery.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view.g.dart';

class ViewTaskGenerator implements TaskGenerator {
  Task? Function()? taskFactory;

  ViewTaskGenerator({this.taskFactory});

  @override
  int get priority => 100;

  @override
  Task? generateTask() {
    if (taskFactory == null) {
      return null;
    } else {
      return taskFactory!();
    }
  }
}

@riverpod
class ViewDownloader extends _$ViewDownloader {
  int page = 0;
  Gallery? gallery;
  ViewTaskGenerator? factory;

  @override
  Future<bool> build(int id) async {
    await ref
        .watch(galleryDownloadStatusProvider(id).selectAsync((v) => false));
    final gallery = await ref.read(galleryJSProvider(id).future);
    this.gallery = gallery;
    factory = ViewTaskGenerator(taskFactory: downloadNext);
    addTask(factory!);
    ref.onDispose(() {
      removeTask(factory!);
    });
    Future(() {
      downloadSignal.complete();
    });
    return true;
  }

  void setPage(int page) {
    this.page = page;
  }

  Task? downloadNext() {
    if (gallery == null) {
      return null;
    }
    final images = ref.read(galleryDownloadStatusProvider(id).notifier);
    int min = page;
    int max = page;
    if (images.tasks.contains(page)) {
      return Task(
          id: id,
          page: page,
          file: gallery!.files[page],
          total: gallery!.files.length);
    }
    while (min > 0 || max < gallery!.files.length - 1) {
      min--;
      if (min > 0 && images.tasks.contains(min)) {
        return Task(
            id: id,
            page: min,
            file: gallery!.files[min],
            total: gallery!.files.length);
      }
      for (int i = 0; i < 3; i++) {
        max++;
        if (max < gallery!.files.length && images.tasks.contains(max)) {
          return Task(
              id: id,
              page: max,
              file: gallery!.files[max],
              total: gallery!.files.length);
        } else if (max >= gallery!.files.length) {
          break;
        }
      }
    }
    if (factory != null) {
      removeTask(factory!);
    }
    return null;
  }
}
