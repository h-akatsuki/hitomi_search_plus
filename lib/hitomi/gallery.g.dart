// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LanguageImpl _$$LanguageImplFromJson(Map<String, dynamic> json) =>
    _$LanguageImpl(
      name: json['name'] as String,
      galleryid: const GalleryIdConverter().fromJson(json['galleryid']),
      url: json['url'] as String,
      languageLocalname: json['language_localname'] as String,
    );

Map<String, dynamic> _$$LanguageImplToJson(_$LanguageImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'galleryid': const GalleryIdConverter().toJson(instance.galleryid),
      'url': instance.url,
      'language_localname': instance.languageLocalname,
    };

_$FileImpl _$$FileImplFromJson(Map<String, dynamic> json) => _$FileImpl(
      height: (json['height'] as num).toInt(),
      hash: json['hash'] as String,
      width: (json['width'] as num).toInt(),
      name: json['name'] as String,
      haswebp: json['haswebp'] == null
          ? false
          : const BoolConverter().fromJson(json['haswebp']),
      hasavif: json['hasavif'] == null
          ? false
          : const BoolConverter().fromJson(json['hasavif']),
      hasjxl: json['hasjxl'] == null
          ? false
          : const BoolConverter().fromJson(json['hasjxl']),
    );

Map<String, dynamic> _$$FileImplToJson(_$FileImpl instance) =>
    <String, dynamic>{
      'height': instance.height,
      'hash': instance.hash,
      'width': instance.width,
      'name': instance.name,
      'haswebp': const BoolConverter().toJson(instance.haswebp),
      'hasavif': const BoolConverter().toJson(instance.hasavif),
      'hasjxl': const BoolConverter().toJson(instance.hasjxl),
    };

_$GroupImpl _$$GroupImplFromJson(Map<String, dynamic> json) => _$GroupImpl(
      group: json['group'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$GroupImplToJson(_$GroupImpl instance) =>
    <String, dynamic>{
      'group': instance.group,
      'url': instance.url,
    };

_$ParodyImpl _$$ParodyImplFromJson(Map<String, dynamic> json) => _$ParodyImpl(
      parody: json['parody'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$ParodyImplToJson(_$ParodyImpl instance) =>
    <String, dynamic>{
      'parody': instance.parody,
      'url': instance.url,
    };

_$ArtistImpl _$$ArtistImplFromJson(Map<String, dynamic> json) => _$ArtistImpl(
      artist: json['artist'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$ArtistImplToJson(_$ArtistImpl instance) =>
    <String, dynamic>{
      'artist': instance.artist,
      'url': instance.url,
    };

_$CharacterImpl _$$CharacterImplFromJson(Map<String, dynamic> json) =>
    _$CharacterImpl(
      character: json['character'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$CharacterImplToJson(_$CharacterImpl instance) =>
    <String, dynamic>{
      'character': instance.character,
      'url': instance.url,
    };

_$TagImpl _$$TagImplFromJson(Map<String, dynamic> json) => _$TagImpl(
      female: json['female'] == null
          ? false
          : const BoolConverter().fromJson(json['female']),
      male: json['male'] == null
          ? false
          : const BoolConverter().fromJson(json['male']),
      tag: json['tag'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$TagImplToJson(_$TagImpl instance) => <String, dynamic>{
      'female': const BoolConverter().toJson(instance.female),
      'male': const BoolConverter().toJson(instance.male),
      'tag': instance.tag,
      'url': instance.url,
    };

_$GalleryImpl _$$GalleryImplFromJson(Map<String, dynamic> json) =>
    _$GalleryImpl(
      type: json['type'] as String,
      video: json['video'] as String?,
      japaneseTitle: json['japanese_title'] as String?,
      language: json['language'] as String?,
      languageUrl: json['language_url'] as String?,
      languages: (json['languages'] as List<dynamic>?)
              ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      date: json['date'] as String,
      files: (json['files'] as List<dynamic>?)
              ?.map((e) => File.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      id: const GalleryIdConverter().fromJson(json['id']),
      blocked: json['blocked'] == null
          ? false
          : const BoolConverter().fromJson(json['blocked']),
      groups: (json['groups'] as List<dynamic>?)
              ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      title: json['title'] as String,
      parodys: (json['parodys'] as List<dynamic>?)
              ?.map((e) => Parody.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      related: const IDListConverter().fromJson(json['related']),
      galleryUrl: json['galleryurl'] as String,
      artists: (json['artists'] as List<dynamic>?)
              ?.map((e) => Artist.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      videoFilename: json['videofilename'] as String?,
      characters: (json['characters'] as List<dynamic>?)
              ?.map((e) => Character.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      languageLocalname: json['language_localname'] as String?,
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      sceneIndexes: const IDListConverter().fromJson(json['sceneIndexes']),
    );

Map<String, dynamic> _$$GalleryImplToJson(_$GalleryImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'video': instance.video,
      'japanese_title': instance.japaneseTitle,
      'language': instance.language,
      'language_url': instance.languageUrl,
      'languages': instance.languages,
      'date': instance.date,
      'files': instance.files,
      'id': const GalleryIdConverter().toJson(instance.id),
      'blocked': const BoolConverter().toJson(instance.blocked),
      'groups': instance.groups,
      'title': instance.title,
      'parodys': instance.parodys,
      'related': const IDListConverter().toJson(instance.related),
      'galleryurl': instance.galleryUrl,
      'artists': instance.artists,
      'videofilename': instance.videoFilename,
      'characters': instance.characters,
      'language_localname': instance.languageLocalname,
      'tags': instance.tags,
      'sceneIndexes': const IDListConverter().toJson(instance.sceneIndexes),
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$galleryJSHash() => r'b7e2eb50e0405f36fce7f943c29f4e959630b068';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [galleryJS].
@ProviderFor(galleryJS)
const galleryJSProvider = GalleryJSFamily();

/// See also [galleryJS].
class GalleryJSFamily extends Family<AsyncValue<Gallery>> {
  /// See also [galleryJS].
  const GalleryJSFamily();

  /// See also [galleryJS].
  GalleryJSProvider call(
    int id,
  ) {
    return GalleryJSProvider(
      id,
    );
  }

  @override
  GalleryJSProvider getProviderOverride(
    covariant GalleryJSProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'galleryJSProvider';
}

/// See also [galleryJS].
class GalleryJSProvider extends AutoDisposeFutureProvider<Gallery> {
  /// See also [galleryJS].
  GalleryJSProvider(
    int id,
  ) : this._internal(
          (ref) => galleryJS(
            ref as GalleryJSRef,
            id,
          ),
          from: galleryJSProvider,
          name: r'galleryJSProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$galleryJSHash,
          dependencies: GalleryJSFamily._dependencies,
          allTransitiveDependencies: GalleryJSFamily._allTransitiveDependencies,
          id: id,
        );

  GalleryJSProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Gallery> Function(GalleryJSRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GalleryJSProvider._internal(
        (ref) => create(ref as GalleryJSRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Gallery> createElement() {
    return _GalleryJSProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GalleryJSProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GalleryJSRef on AutoDisposeFutureProviderRef<Gallery> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GalleryJSProviderElement
    extends AutoDisposeFutureProviderElement<Gallery> with GalleryJSRef {
  _GalleryJSProviderElement(super.provider);

  @override
  int get id => (origin as GalleryJSProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
