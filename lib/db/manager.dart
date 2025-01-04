import 'package:hitomi_search_plus/db/image.dart';
import 'package:hitomi_search_plus/db/like.dart';
import 'package:hitomi_search_plus/db/tasks.dart';
import 'package:hitomi_search_plus/main.dart';

Future<void> deleteUnlikedGalleryCache() async {
  final rows = await db.rawQuery('SELECT DISTINCT id FROM image');
  for (final row in rows) {
    final id = row['id'] as int;
    final bool isLikedGallery = await isLiked(id);
    if (!isLikedGallery) {
      await deleteImages(id);
      await deleteTask(id);
    }
  }
}

