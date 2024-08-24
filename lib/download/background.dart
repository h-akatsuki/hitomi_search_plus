import 'package:hitomi_search_plus/db/like.dart';
import 'package:hitomi_search_plus/download/download.dart';
import 'package:hitomi_search_plus/download/gallery.dart';
import 'package:hitomi_search_plus/hitomi/gallery.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'background.g.dart';

@Riverpod(keepAlive: true)
class BackgroundDownloader extends _$BackgroundDownloader {
  bool running = false;

  @override
  List<int> build() {
    Future(() {
      load();
    });
    final listen = likeStream.stream.listen((event) {
      updateState(event);
    });
    ref.onDispose(() {
      listen.cancel();
    });
    return [];
  }

  Future<void> load() async {
    final res = await getUnDoneList();
    state = res;
    loadNext();
  }

  void updateState(LikeUpdate update) {
    if (!update.value || update.done == true) {
      return;
    }
    final List<int> newState;
    if (update.value) {
      newState = [update.galleryId, ...state];
    } else {
      newState = state.where((e) => e != update.galleryId).toList();
    }
    state = newState;
    loadNext();
  }

  void loadNext({bool done = false}) {
    if (!done && running) {
      return;
    }
    running = true;
    if (state.isEmpty) {
      running = false;
      return;
    }
    final id = state.first;
    ref.read(backgroundSingleDownloaderProvider(id));
    state = state.sublist(1);
  }
}

class BackgroundTaskGenerator implements TaskGenerator {
  Task? Function() taskFactory;

  BackgroundTaskGenerator({required this.taskFactory});

  @override
  int get priority => 50;

  @override
  Task? generateTask() {
    return taskFactory();
  }
}

@riverpod
class BackgroundSingleDownloader extends _$BackgroundSingleDownloader {
  BackgroundTaskGenerator? factory;
  Gallery? gallery;
  KeepAliveLink? link;
  bool callNext = false;

  @override
  bool build(int id) {
    ref.watch(galleryDownloadStatusProvider(id).selectAsync((v) => false));
    ref.onDispose(() {
      removeTask(factory!);
    });
    link = ref.keepAlive();
    Future(() {
      load();
    });
    return false;
  }

  Future<void> load() async {
    await ref.read(galleryDownloadStatusProvider(id).future);
    final gallery = await ref.read(galleryJSProvider(id).future);
    this.gallery = gallery;
    factory = BackgroundTaskGenerator(taskFactory: downloadNext);
    addTask(factory!);
    downloadSignal.complete();
  }

  Task? downloadNext() {
    final data = ref.read(galleryDownloadStatusProvider(id).notifier);
    if (data.tasks.isEmpty) {
      state = true;
      link?.close();
      if (!callNext) {
        callNext = true;
        ref.read(backgroundDownloaderProvider.notifier).loadNext(done: true);
      }
      return null;
    }
    final page = data.tasks.first;
    return Task(
      id: id,
      page: page,
      file: gallery!.files[page],
      total: gallery!.files.length,
    );
  }
}
