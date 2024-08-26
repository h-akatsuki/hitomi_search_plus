import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hitomi_search_plus/root.dart';
import 'package:hitomi_search_plus/src/rust/frb_generated.dart';
import 'package:hitomi_search_plus/tools/mouse.dart';
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
      final saveDir = Directory('save');
      if (await saveDir.exists()) {
        appDocDir = saveDir;
      } else {
        appDocDir = await getApplicationDocumentsDirectory();
      }
    } else {
      appDocDir = await getApplicationDocumentsDirectory();
    }
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    initPath(),
    RustLib.init(),
    MouseButtonDetector.initialize(),
  ]);
  runApp(const ProviderScope(child: HitomiSearchPlus()));
}

class HitomiSearchPlus extends ConsumerWidget {
  const HitomiSearchPlus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const theme = MaterialTheme(TextTheme());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: theme.dark(),
      theme: theme.light(),
      themeMode: ThemeMode.system,
      home: const Root(),
    );
  }
}
