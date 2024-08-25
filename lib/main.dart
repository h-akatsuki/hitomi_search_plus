import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hitomi_search_plus/db/default_query.dart';
import 'package:hitomi_search_plus/db/gallery_cache.dart';
import 'package:hitomi_search_plus/db/init.dart';
import 'package:hitomi_search_plus/download/background.dart';
import 'package:hitomi_search_plus/download/download.dart';
import 'package:hitomi_search_plus/page/home.dart';
import 'package:hitomi_search_plus/page/settings.dart';
import 'package:hitomi_search_plus/server/tags.dart';
import 'package:hitomi_search_plus/src/rust/frb_generated.dart';
import 'package:hitomi_search_plus/tools/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

late final Directory appDocDir;
late final Database db;

Future<void> initPath() async {
  if (kDebugMode && Platform.isWindows) {
    appDocDir = Directory('data');
  } else {
    if (Platform.isWindows) {
      // Portable mode
      final saveDir = Directory('save');
      if (await saveDir.exists()) {
        appDocDir = saveDir;
      } else {
        appDocDir = await getApplicationDocumentsDirectory();
      }
    }
    appDocDir = await getApplicationDocumentsDirectory();
  }
  db = await initDb();
  await Future.wait([
    initSettings(),
    initDefaultQuery(),
  ]);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    initPath(),
    RustLib.init(),
  ]);
  initTagsSuggest();
  Future(() => clearExpiredGalleryCache());
  runApp(const ProviderScope(child: HitomiSearchPlus()));
}

class HitomiSearchPlus extends ConsumerWidget {
  const HitomiSearchPlus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(dwonloadWorkersProvider);
    ref.read(backgroundDownloaderProvider);
    const theme = MaterialTheme(TextTheme());
    final themeMode = ref.watch(themeSettingProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: theme.dark(),
      theme: theme.light(),
      themeMode: themeMode,
      home: const Home(),
    );
  }
}
