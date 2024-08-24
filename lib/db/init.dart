import 'package:hitomi_search_plus/db/bookmark.dart';
import 'package:hitomi_search_plus/db/gallery_cache.dart';
import 'package:hitomi_search_plus/db/history.dart';
import 'package:hitomi_search_plus/db/image.dart';
import 'package:hitomi_search_plus/db/kv.dart';
import 'package:hitomi_search_plus/db/like.dart';
import 'package:hitomi_search_plus/db/small_image.dart';
import 'package:hitomi_search_plus/db/tasks.dart';
import 'package:hitomi_search_plus/main.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<Database> initDb() async {
  sqfliteFfiInit();
  final db = await databaseFactoryFfi
      .openDatabase(join(appDocDir.absolute.path, 'hitomi_search_plus.db'));
  await initKV(db);
  await initGalleryCache(db);
  await initBookmark(db);
  await initImage(db);
  await initTasks(db);
  await initLike(db);
  await initHistory(db);
  await initSmallImage(db);
  return db;
}
