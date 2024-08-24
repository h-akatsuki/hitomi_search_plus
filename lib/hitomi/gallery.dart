import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hitomi_search_plus/db/gallery_cache.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gallery.freezed.dart';
part 'gallery.g.dart';

class GalleryIdConverter implements JsonConverter<int, dynamic> {
  const GalleryIdConverter();

  @override
  int fromJson(dynamic json) {
    if (json is String) {
      return int.parse(json);
    } else if (json is int) {
      return json;
    } else {
      throw Exception("Invalid type");
    }
  }

  @override
  int toJson(int object) {
    return object;
  }
}

class BoolConverter implements JsonConverter<bool, dynamic> {
  const BoolConverter();

  @override
  bool fromJson(dynamic json) {
    if (json is String) {
      return json == "1";
    } else if (json is int) {
      return json == 1;
    } else {
      throw Exception("Invalid type");
    }
  }

  @override
  dynamic toJson(bool object) {
    return object ? "1" : "0";
  }
}

class IDListConverter implements JsonConverter<List<int>, dynamic> {
  const IDListConverter();

  @override
  List<int> fromJson(dynamic json) {
    if (json == null) return [];
    if (json is List) {
      return json.map((e) {
        if (e is String) {
          return int.parse(e);
        } else if (e is int) {
          return e;
        } else {
          throw Exception("Invalid type");
        }
      }).toList();
    } else {
      throw Exception("Invalid type");
    }
  }

  @override
  dynamic toJson(List<int> object) {
    return object;
  }
}

@freezed
class Language with _$Language {
  factory Language({
    required String name,
    @GalleryIdConverter() required int galleryid,
    required String url,
    @JsonKey(name: 'language_localname') required String languageLocalname,
  }) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);
}

@freezed
class File with _$File {
  factory File({
    required int height,
    required String hash,
    required int width,
    required String name,
    @BoolConverter() @Default(false) bool haswebp,
    @BoolConverter() @Default(false) bool hasavif,
    @BoolConverter() @Default(false) bool hasjxl,
  }) = _File;

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);
}

@freezed
class Group with _$Group {
  factory Group({
    required String group,
    required String url,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}

@freezed
class Parody with _$Parody {
  factory Parody({
    required String parody,
    required String url,
  }) = _Parody;

  factory Parody.fromJson(Map<String, dynamic> json) => _$ParodyFromJson(json);
}

@freezed
class Artist with _$Artist {
  factory Artist({
    required String artist,
    required String url,
  }) = _Artist;

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
}

@freezed
class Character with _$Character {
  factory Character({
    required String character,
    required String url,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}

@freezed
class Tag with _$Tag {
  const Tag._();
  factory Tag({
    @BoolConverter() @Default(false) bool female,
    @BoolConverter() @Default(false) bool male,
    required String tag,
    required String url,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  IconData icon() {
    if (female) {
      return Icons.female;
    } else if (male) {
      return Icons.male;
    } else {
      return Icons.tag;
    }
  }
}

@freezed
class Gallery with _$Gallery {
  @JsonSerializable(explicitToJson: true)
  const Gallery._();
  factory Gallery({
    required String type,
    String? video,
    @JsonKey(name: 'japanese_title') String? japaneseTitle,
    String? language,
    @JsonKey(name: 'language_url') String? languageUrl,
    @Default([]) List<Language> languages,
    required String date,
    @Default([]) List<File> files,
    @GalleryIdConverter() required int id,
    @BoolConverter() @Default(false) bool blocked,
    @Default([]) List<Group> groups,
    required String title,
    @Default([]) List<Parody> parodys,
    @IDListConverter() required List<int> related,
    @JsonKey(name: 'galleryurl') required String galleryUrl,
    @Default([]) List<Artist> artists,
    @JsonKey(name: 'videofilename') String? videoFilename,
    @Default([]) List<Character> characters,
    @JsonKey(name: 'language_localname') String? languageLocalname,
    @Default([]) List<Tag> tags,
    @IDListConverter() required List<int> sceneIndexes,
  }) = _Gallery;

  factory Gallery.fromJson(Map<String, dynamic> json) =>
      _$GalleryFromJson(json);

  String url() {
    return Uri.https("hitomi.la", galleryUrl).toString();
  }

  static String jsUrl(int id) {
    return "https://ltn.hitomi.la/galleries/$id.js";
  }

  String urlFromId() {
    return "https://hitomi.la/galleries/$id.html";
  }

  static Gallery fromJS(String js) {
    final jsonData = js.substring(js.indexOf("{"));
    return Gallery.fromJson(jsonDecode(jsonData) as Map<String, dynamic>);
  }

  String localDateStr() {
    final date = DateTime.parse(this.date);
    return "${date.year}-${date.month}-${date.day}";
  }
}

final http.Client client = http.Client();

@riverpod
Future<Gallery> galleryJS(GalleryJSRef ref, int id) async {
  final cache = await getGalleryCache(id);
  if (cache != null) {
    return Gallery.fromJS(cache);
  }
  final response = await client.get(Uri.parse(Gallery.jsUrl(id)));
  setGalleryCache(id, response.body);
  final gallery = Gallery.fromJS(response.body);
  return gallery;
}
