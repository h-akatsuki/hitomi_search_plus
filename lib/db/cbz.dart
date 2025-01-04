import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:hitomi_search_plus/db/image.dart';
import 'package:hitomi_search_plus/db/kv.dart';
import 'package:hitomi_search_plus/hitomi/gallery.dart';
import 'package:path/path.dart' as path;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cbz.g.dart';

const key = 'download_dir';

@Riverpod(keepAlive: true)
class DownloadDir extends _$DownloadDir {
  @override
  Future<Directory?> build() async {
    final path = await getKV(key);
    if (path == null) return null;
    return Directory(path);
  }

  Future<void> set(Directory value) {
    state = AsyncData(value);
    return setKV(key, value.path);
  }
}

Future<void> exportCBZ(Directory dir, Gallery gallery) async {
  final images = await getImagesById(gallery.id);
  final comicinfo = gallery.toComicInfoXml();
  final filename = '${dir.path}${path.separator}${gallery.id}.cbz';
  final archive = ZipFileEncoder();

  archive.create(filename);

  archive.addArchiveFile(ArchiveFile(
    'ComicInfo.xml',
    comicinfo.length,
    utf8.encode(comicinfo),
  ));

  for (int i = 0; i < images.length; i++) {
    final name = images[i]['name'] as String;
    final data = images[i]['data'] as List<int>;
    final ext = path.extension(name);
    String pageName = i.toString().padLeft(3, '0') + ext;
    archive.addArchiveFile(ArchiveFile(pageName, data.length, data));
  }

  await archive.close();
}
