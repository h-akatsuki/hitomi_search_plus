// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Language _$LanguageFromJson(Map<String, dynamic> json) {
  return _Language.fromJson(json);
}

/// @nodoc
mixin _$Language {
  String get name => throw _privateConstructorUsedError;
  @GalleryIdConverter()
  int get galleryid => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'language_localname')
  String get languageLocalname => throw _privateConstructorUsedError;

  /// Serializes this Language to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Language
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LanguageCopyWith<Language> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageCopyWith<$Res> {
  factory $LanguageCopyWith(Language value, $Res Function(Language) then) =
      _$LanguageCopyWithImpl<$Res, Language>;
  @useResult
  $Res call(
      {String name,
      @GalleryIdConverter() int galleryid,
      String url,
      @JsonKey(name: 'language_localname') String languageLocalname});
}

/// @nodoc
class _$LanguageCopyWithImpl<$Res, $Val extends Language>
    implements $LanguageCopyWith<$Res> {
  _$LanguageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Language
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? galleryid = null,
    Object? url = null,
    Object? languageLocalname = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      galleryid: null == galleryid
          ? _value.galleryid
          : galleryid // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      languageLocalname: null == languageLocalname
          ? _value.languageLocalname
          : languageLocalname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LanguageImplCopyWith<$Res>
    implements $LanguageCopyWith<$Res> {
  factory _$$LanguageImplCopyWith(
          _$LanguageImpl value, $Res Function(_$LanguageImpl) then) =
      __$$LanguageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @GalleryIdConverter() int galleryid,
      String url,
      @JsonKey(name: 'language_localname') String languageLocalname});
}

/// @nodoc
class __$$LanguageImplCopyWithImpl<$Res>
    extends _$LanguageCopyWithImpl<$Res, _$LanguageImpl>
    implements _$$LanguageImplCopyWith<$Res> {
  __$$LanguageImplCopyWithImpl(
      _$LanguageImpl _value, $Res Function(_$LanguageImpl) _then)
      : super(_value, _then);

  /// Create a copy of Language
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? galleryid = null,
    Object? url = null,
    Object? languageLocalname = null,
  }) {
    return _then(_$LanguageImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      galleryid: null == galleryid
          ? _value.galleryid
          : galleryid // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      languageLocalname: null == languageLocalname
          ? _value.languageLocalname
          : languageLocalname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LanguageImpl implements _Language {
  _$LanguageImpl(
      {required this.name,
      @GalleryIdConverter() required this.galleryid,
      required this.url,
      @JsonKey(name: 'language_localname') required this.languageLocalname});

  factory _$LanguageImpl.fromJson(Map<String, dynamic> json) =>
      _$$LanguageImplFromJson(json);

  @override
  final String name;
  @override
  @GalleryIdConverter()
  final int galleryid;
  @override
  final String url;
  @override
  @JsonKey(name: 'language_localname')
  final String languageLocalname;

  @override
  String toString() {
    return 'Language(name: $name, galleryid: $galleryid, url: $url, languageLocalname: $languageLocalname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.galleryid, galleryid) ||
                other.galleryid == galleryid) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.languageLocalname, languageLocalname) ||
                other.languageLocalname == languageLocalname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, galleryid, url, languageLocalname);

  /// Create a copy of Language
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageImplCopyWith<_$LanguageImpl> get copyWith =>
      __$$LanguageImplCopyWithImpl<_$LanguageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LanguageImplToJson(
      this,
    );
  }
}

abstract class _Language implements Language {
  factory _Language(
      {required final String name,
      @GalleryIdConverter() required final int galleryid,
      required final String url,
      @JsonKey(name: 'language_localname')
      required final String languageLocalname}) = _$LanguageImpl;

  factory _Language.fromJson(Map<String, dynamic> json) =
      _$LanguageImpl.fromJson;

  @override
  String get name;
  @override
  @GalleryIdConverter()
  int get galleryid;
  @override
  String get url;
  @override
  @JsonKey(name: 'language_localname')
  String get languageLocalname;

  /// Create a copy of Language
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LanguageImplCopyWith<_$LanguageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

File _$FileFromJson(Map<String, dynamic> json) {
  return _File.fromJson(json);
}

/// @nodoc
mixin _$File {
  int get height => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @BoolConverter()
  bool get haswebp => throw _privateConstructorUsedError;
  @BoolConverter()
  bool get hasavif => throw _privateConstructorUsedError;
  @BoolConverter()
  bool get hasjxl => throw _privateConstructorUsedError;

  /// Serializes this File to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of File
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileCopyWith<File> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileCopyWith<$Res> {
  factory $FileCopyWith(File value, $Res Function(File) then) =
      _$FileCopyWithImpl<$Res, File>;
  @useResult
  $Res call(
      {int height,
      String hash,
      int width,
      String name,
      @BoolConverter() bool haswebp,
      @BoolConverter() bool hasavif,
      @BoolConverter() bool hasjxl});
}

/// @nodoc
class _$FileCopyWithImpl<$Res, $Val extends File>
    implements $FileCopyWith<$Res> {
  _$FileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of File
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? hash = null,
    Object? width = null,
    Object? name = null,
    Object? haswebp = null,
    Object? hasavif = null,
    Object? hasjxl = null,
  }) {
    return _then(_value.copyWith(
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      haswebp: null == haswebp
          ? _value.haswebp
          : haswebp // ignore: cast_nullable_to_non_nullable
              as bool,
      hasavif: null == hasavif
          ? _value.hasavif
          : hasavif // ignore: cast_nullable_to_non_nullable
              as bool,
      hasjxl: null == hasjxl
          ? _value.hasjxl
          : hasjxl // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileImplCopyWith<$Res> implements $FileCopyWith<$Res> {
  factory _$$FileImplCopyWith(
          _$FileImpl value, $Res Function(_$FileImpl) then) =
      __$$FileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int height,
      String hash,
      int width,
      String name,
      @BoolConverter() bool haswebp,
      @BoolConverter() bool hasavif,
      @BoolConverter() bool hasjxl});
}

/// @nodoc
class __$$FileImplCopyWithImpl<$Res>
    extends _$FileCopyWithImpl<$Res, _$FileImpl>
    implements _$$FileImplCopyWith<$Res> {
  __$$FileImplCopyWithImpl(_$FileImpl _value, $Res Function(_$FileImpl) _then)
      : super(_value, _then);

  /// Create a copy of File
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? hash = null,
    Object? width = null,
    Object? name = null,
    Object? haswebp = null,
    Object? hasavif = null,
    Object? hasjxl = null,
  }) {
    return _then(_$FileImpl(
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      haswebp: null == haswebp
          ? _value.haswebp
          : haswebp // ignore: cast_nullable_to_non_nullable
              as bool,
      hasavif: null == hasavif
          ? _value.hasavif
          : hasavif // ignore: cast_nullable_to_non_nullable
              as bool,
      hasjxl: null == hasjxl
          ? _value.hasjxl
          : hasjxl // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FileImpl implements _File {
  _$FileImpl(
      {required this.height,
      required this.hash,
      required this.width,
      required this.name,
      @BoolConverter() this.haswebp = false,
      @BoolConverter() this.hasavif = false,
      @BoolConverter() this.hasjxl = false});

  factory _$FileImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileImplFromJson(json);

  @override
  final int height;
  @override
  final String hash;
  @override
  final int width;
  @override
  final String name;
  @override
  @JsonKey()
  @BoolConverter()
  final bool haswebp;
  @override
  @JsonKey()
  @BoolConverter()
  final bool hasavif;
  @override
  @JsonKey()
  @BoolConverter()
  final bool hasjxl;

  @override
  String toString() {
    return 'File(height: $height, hash: $hash, width: $width, name: $name, haswebp: $haswebp, hasavif: $hasavif, hasjxl: $hasjxl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileImpl &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.haswebp, haswebp) || other.haswebp == haswebp) &&
            (identical(other.hasavif, hasavif) || other.hasavif == hasavif) &&
            (identical(other.hasjxl, hasjxl) || other.hasjxl == hasjxl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, height, hash, width, name, haswebp, hasavif, hasjxl);

  /// Create a copy of File
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileImplCopyWith<_$FileImpl> get copyWith =>
      __$$FileImplCopyWithImpl<_$FileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileImplToJson(
      this,
    );
  }
}

abstract class _File implements File {
  factory _File(
      {required final int height,
      required final String hash,
      required final int width,
      required final String name,
      @BoolConverter() final bool haswebp,
      @BoolConverter() final bool hasavif,
      @BoolConverter() final bool hasjxl}) = _$FileImpl;

  factory _File.fromJson(Map<String, dynamic> json) = _$FileImpl.fromJson;

  @override
  int get height;
  @override
  String get hash;
  @override
  int get width;
  @override
  String get name;
  @override
  @BoolConverter()
  bool get haswebp;
  @override
  @BoolConverter()
  bool get hasavif;
  @override
  @BoolConverter()
  bool get hasjxl;

  /// Create a copy of File
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileImplCopyWith<_$FileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Group _$GroupFromJson(Map<String, dynamic> json) {
  return _Group.fromJson(json);
}

/// @nodoc
mixin _$Group {
  String get group => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this Group to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupCopyWith<Group> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupCopyWith<$Res> {
  factory $GroupCopyWith(Group value, $Res Function(Group) then) =
      _$GroupCopyWithImpl<$Res, Group>;
  @useResult
  $Res call({String group, String url});
}

/// @nodoc
class _$GroupCopyWithImpl<$Res, $Val extends Group>
    implements $GroupCopyWith<$Res> {
  _$GroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupImplCopyWith<$Res> implements $GroupCopyWith<$Res> {
  factory _$$GroupImplCopyWith(
          _$GroupImpl value, $Res Function(_$GroupImpl) then) =
      __$$GroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String group, String url});
}

/// @nodoc
class __$$GroupImplCopyWithImpl<$Res>
    extends _$GroupCopyWithImpl<$Res, _$GroupImpl>
    implements _$$GroupImplCopyWith<$Res> {
  __$$GroupImplCopyWithImpl(
      _$GroupImpl _value, $Res Function(_$GroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
    Object? url = null,
  }) {
    return _then(_$GroupImpl(
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupImpl implements _Group {
  _$GroupImpl({required this.group, required this.url});

  factory _$GroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupImplFromJson(json);

  @override
  final String group;
  @override
  final String url;

  @override
  String toString() {
    return 'Group(group: $group, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupImpl &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, group, url);

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupImplCopyWith<_$GroupImpl> get copyWith =>
      __$$GroupImplCopyWithImpl<_$GroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupImplToJson(
      this,
    );
  }
}

abstract class _Group implements Group {
  factory _Group({required final String group, required final String url}) =
      _$GroupImpl;

  factory _Group.fromJson(Map<String, dynamic> json) = _$GroupImpl.fromJson;

  @override
  String get group;
  @override
  String get url;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupImplCopyWith<_$GroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Parody _$ParodyFromJson(Map<String, dynamic> json) {
  return _Parody.fromJson(json);
}

/// @nodoc
mixin _$Parody {
  String get parody => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this Parody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Parody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParodyCopyWith<Parody> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParodyCopyWith<$Res> {
  factory $ParodyCopyWith(Parody value, $Res Function(Parody) then) =
      _$ParodyCopyWithImpl<$Res, Parody>;
  @useResult
  $Res call({String parody, String url});
}

/// @nodoc
class _$ParodyCopyWithImpl<$Res, $Val extends Parody>
    implements $ParodyCopyWith<$Res> {
  _$ParodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Parody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parody = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      parody: null == parody
          ? _value.parody
          : parody // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParodyImplCopyWith<$Res> implements $ParodyCopyWith<$Res> {
  factory _$$ParodyImplCopyWith(
          _$ParodyImpl value, $Res Function(_$ParodyImpl) then) =
      __$$ParodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String parody, String url});
}

/// @nodoc
class __$$ParodyImplCopyWithImpl<$Res>
    extends _$ParodyCopyWithImpl<$Res, _$ParodyImpl>
    implements _$$ParodyImplCopyWith<$Res> {
  __$$ParodyImplCopyWithImpl(
      _$ParodyImpl _value, $Res Function(_$ParodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Parody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parody = null,
    Object? url = null,
  }) {
    return _then(_$ParodyImpl(
      parody: null == parody
          ? _value.parody
          : parody // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParodyImpl implements _Parody {
  _$ParodyImpl({required this.parody, required this.url});

  factory _$ParodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParodyImplFromJson(json);

  @override
  final String parody;
  @override
  final String url;

  @override
  String toString() {
    return 'Parody(parody: $parody, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParodyImpl &&
            (identical(other.parody, parody) || other.parody == parody) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, parody, url);

  /// Create a copy of Parody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParodyImplCopyWith<_$ParodyImpl> get copyWith =>
      __$$ParodyImplCopyWithImpl<_$ParodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParodyImplToJson(
      this,
    );
  }
}

abstract class _Parody implements Parody {
  factory _Parody({required final String parody, required final String url}) =
      _$ParodyImpl;

  factory _Parody.fromJson(Map<String, dynamic> json) = _$ParodyImpl.fromJson;

  @override
  String get parody;
  @override
  String get url;

  /// Create a copy of Parody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParodyImplCopyWith<_$ParodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Artist _$ArtistFromJson(Map<String, dynamic> json) {
  return _Artist.fromJson(json);
}

/// @nodoc
mixin _$Artist {
  String get artist => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this Artist to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Artist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtistCopyWith<Artist> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistCopyWith<$Res> {
  factory $ArtistCopyWith(Artist value, $Res Function(Artist) then) =
      _$ArtistCopyWithImpl<$Res, Artist>;
  @useResult
  $Res call({String artist, String url});
}

/// @nodoc
class _$ArtistCopyWithImpl<$Res, $Val extends Artist>
    implements $ArtistCopyWith<$Res> {
  _$ArtistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Artist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artist = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtistImplCopyWith<$Res> implements $ArtistCopyWith<$Res> {
  factory _$$ArtistImplCopyWith(
          _$ArtistImpl value, $Res Function(_$ArtistImpl) then) =
      __$$ArtistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String artist, String url});
}

/// @nodoc
class __$$ArtistImplCopyWithImpl<$Res>
    extends _$ArtistCopyWithImpl<$Res, _$ArtistImpl>
    implements _$$ArtistImplCopyWith<$Res> {
  __$$ArtistImplCopyWithImpl(
      _$ArtistImpl _value, $Res Function(_$ArtistImpl) _then)
      : super(_value, _then);

  /// Create a copy of Artist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artist = null,
    Object? url = null,
  }) {
    return _then(_$ArtistImpl(
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtistImpl implements _Artist {
  _$ArtistImpl({required this.artist, required this.url});

  factory _$ArtistImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtistImplFromJson(json);

  @override
  final String artist;
  @override
  final String url;

  @override
  String toString() {
    return 'Artist(artist: $artist, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistImpl &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, artist, url);

  /// Create a copy of Artist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtistImplCopyWith<_$ArtistImpl> get copyWith =>
      __$$ArtistImplCopyWithImpl<_$ArtistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtistImplToJson(
      this,
    );
  }
}

abstract class _Artist implements Artist {
  factory _Artist({required final String artist, required final String url}) =
      _$ArtistImpl;

  factory _Artist.fromJson(Map<String, dynamic> json) = _$ArtistImpl.fromJson;

  @override
  String get artist;
  @override
  String get url;

  /// Create a copy of Artist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtistImplCopyWith<_$ArtistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Character _$CharacterFromJson(Map<String, dynamic> json) {
  return _Character.fromJson(json);
}

/// @nodoc
mixin _$Character {
  String get character => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this Character to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterCopyWith<Character> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterCopyWith<$Res> {
  factory $CharacterCopyWith(Character value, $Res Function(Character) then) =
      _$CharacterCopyWithImpl<$Res, Character>;
  @useResult
  $Res call({String character, String url});
}

/// @nodoc
class _$CharacterCopyWithImpl<$Res, $Val extends Character>
    implements $CharacterCopyWith<$Res> {
  _$CharacterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? character = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CharacterImplCopyWith<$Res>
    implements $CharacterCopyWith<$Res> {
  factory _$$CharacterImplCopyWith(
          _$CharacterImpl value, $Res Function(_$CharacterImpl) then) =
      __$$CharacterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String character, String url});
}

/// @nodoc
class __$$CharacterImplCopyWithImpl<$Res>
    extends _$CharacterCopyWithImpl<$Res, _$CharacterImpl>
    implements _$$CharacterImplCopyWith<$Res> {
  __$$CharacterImplCopyWithImpl(
      _$CharacterImpl _value, $Res Function(_$CharacterImpl) _then)
      : super(_value, _then);

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? character = null,
    Object? url = null,
  }) {
    return _then(_$CharacterImpl(
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterImpl implements _Character {
  _$CharacterImpl({required this.character, required this.url});

  factory _$CharacterImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterImplFromJson(json);

  @override
  final String character;
  @override
  final String url;

  @override
  String toString() {
    return 'Character(character: $character, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterImpl &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, character, url);

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterImplCopyWith<_$CharacterImpl> get copyWith =>
      __$$CharacterImplCopyWithImpl<_$CharacterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterImplToJson(
      this,
    );
  }
}

abstract class _Character implements Character {
  factory _Character(
      {required final String character,
      required final String url}) = _$CharacterImpl;

  factory _Character.fromJson(Map<String, dynamic> json) =
      _$CharacterImpl.fromJson;

  @override
  String get character;
  @override
  String get url;

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterImplCopyWith<_$CharacterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return _Tag.fromJson(json);
}

/// @nodoc
mixin _$Tag {
  @BoolConverter()
  bool get female => throw _privateConstructorUsedError;
  @BoolConverter()
  bool get male => throw _privateConstructorUsedError;
  String get tag => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this Tag to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Tag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TagCopyWith<Tag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagCopyWith<$Res> {
  factory $TagCopyWith(Tag value, $Res Function(Tag) then) =
      _$TagCopyWithImpl<$Res, Tag>;
  @useResult
  $Res call(
      {@BoolConverter() bool female,
      @BoolConverter() bool male,
      String tag,
      String url});
}

/// @nodoc
class _$TagCopyWithImpl<$Res, $Val extends Tag> implements $TagCopyWith<$Res> {
  _$TagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Tag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? female = null,
    Object? male = null,
    Object? tag = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      female: null == female
          ? _value.female
          : female // ignore: cast_nullable_to_non_nullable
              as bool,
      male: null == male
          ? _value.male
          : male // ignore: cast_nullable_to_non_nullable
              as bool,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagImplCopyWith<$Res> implements $TagCopyWith<$Res> {
  factory _$$TagImplCopyWith(_$TagImpl value, $Res Function(_$TagImpl) then) =
      __$$TagImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@BoolConverter() bool female,
      @BoolConverter() bool male,
      String tag,
      String url});
}

/// @nodoc
class __$$TagImplCopyWithImpl<$Res> extends _$TagCopyWithImpl<$Res, _$TagImpl>
    implements _$$TagImplCopyWith<$Res> {
  __$$TagImplCopyWithImpl(_$TagImpl _value, $Res Function(_$TagImpl) _then)
      : super(_value, _then);

  /// Create a copy of Tag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? female = null,
    Object? male = null,
    Object? tag = null,
    Object? url = null,
  }) {
    return _then(_$TagImpl(
      female: null == female
          ? _value.female
          : female // ignore: cast_nullable_to_non_nullable
              as bool,
      male: null == male
          ? _value.male
          : male // ignore: cast_nullable_to_non_nullable
              as bool,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TagImpl extends _Tag {
  _$TagImpl(
      {@BoolConverter() this.female = false,
      @BoolConverter() this.male = false,
      required this.tag,
      required this.url})
      : super._();

  factory _$TagImpl.fromJson(Map<String, dynamic> json) =>
      _$$TagImplFromJson(json);

  @override
  @JsonKey()
  @BoolConverter()
  final bool female;
  @override
  @JsonKey()
  @BoolConverter()
  final bool male;
  @override
  final String tag;
  @override
  final String url;

  @override
  String toString() {
    return 'Tag(female: $female, male: $male, tag: $tag, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagImpl &&
            (identical(other.female, female) || other.female == female) &&
            (identical(other.male, male) || other.male == male) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, female, male, tag, url);

  /// Create a copy of Tag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TagImplCopyWith<_$TagImpl> get copyWith =>
      __$$TagImplCopyWithImpl<_$TagImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TagImplToJson(
      this,
    );
  }
}

abstract class _Tag extends Tag {
  factory _Tag(
      {@BoolConverter() final bool female,
      @BoolConverter() final bool male,
      required final String tag,
      required final String url}) = _$TagImpl;
  _Tag._() : super._();

  factory _Tag.fromJson(Map<String, dynamic> json) = _$TagImpl.fromJson;

  @override
  @BoolConverter()
  bool get female;
  @override
  @BoolConverter()
  bool get male;
  @override
  String get tag;
  @override
  String get url;

  /// Create a copy of Tag
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TagImplCopyWith<_$TagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Gallery _$GalleryFromJson(Map<String, dynamic> json) {
  return _Gallery.fromJson(json);
}

/// @nodoc
mixin _$Gallery {
  String get type => throw _privateConstructorUsedError;
  String? get video => throw _privateConstructorUsedError;
  @JsonKey(name: 'japanese_title')
  String? get japaneseTitle => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'language_url')
  String? get languageUrl => throw _privateConstructorUsedError;
  List<Language> get languages => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  List<File> get files => throw _privateConstructorUsedError;
  @GalleryIdConverter()
  int get id => throw _privateConstructorUsedError;
  @BoolConverter()
  bool get blocked => throw _privateConstructorUsedError;
  List<Group> get groups => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<Parody> get parodys => throw _privateConstructorUsedError;
  @IDListConverter()
  List<int> get related => throw _privateConstructorUsedError;
  @JsonKey(name: 'galleryurl')
  String get galleryUrl => throw _privateConstructorUsedError;
  List<Artist> get artists => throw _privateConstructorUsedError;
  @JsonKey(name: 'videofilename')
  String? get videoFilename => throw _privateConstructorUsedError;
  List<Character> get characters => throw _privateConstructorUsedError;
  @JsonKey(name: 'language_localname')
  String? get languageLocalname => throw _privateConstructorUsedError;
  List<Tag> get tags => throw _privateConstructorUsedError;
  @IDListConverter()
  List<int> get sceneIndexes => throw _privateConstructorUsedError;

  /// Serializes this Gallery to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Gallery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GalleryCopyWith<Gallery> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryCopyWith<$Res> {
  factory $GalleryCopyWith(Gallery value, $Res Function(Gallery) then) =
      _$GalleryCopyWithImpl<$Res, Gallery>;
  @useResult
  $Res call(
      {String type,
      String? video,
      @JsonKey(name: 'japanese_title') String? japaneseTitle,
      String? language,
      @JsonKey(name: 'language_url') String? languageUrl,
      List<Language> languages,
      String date,
      List<File> files,
      @GalleryIdConverter() int id,
      @BoolConverter() bool blocked,
      List<Group> groups,
      String title,
      List<Parody> parodys,
      @IDListConverter() List<int> related,
      @JsonKey(name: 'galleryurl') String galleryUrl,
      List<Artist> artists,
      @JsonKey(name: 'videofilename') String? videoFilename,
      List<Character> characters,
      @JsonKey(name: 'language_localname') String? languageLocalname,
      List<Tag> tags,
      @IDListConverter() List<int> sceneIndexes});
}

/// @nodoc
class _$GalleryCopyWithImpl<$Res, $Val extends Gallery>
    implements $GalleryCopyWith<$Res> {
  _$GalleryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Gallery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? video = freezed,
    Object? japaneseTitle = freezed,
    Object? language = freezed,
    Object? languageUrl = freezed,
    Object? languages = null,
    Object? date = null,
    Object? files = null,
    Object? id = null,
    Object? blocked = null,
    Object? groups = null,
    Object? title = null,
    Object? parodys = null,
    Object? related = null,
    Object? galleryUrl = null,
    Object? artists = null,
    Object? videoFilename = freezed,
    Object? characters = null,
    Object? languageLocalname = freezed,
    Object? tags = null,
    Object? sceneIndexes = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      japaneseTitle: freezed == japaneseTitle
          ? _value.japaneseTitle
          : japaneseTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      languageUrl: freezed == languageUrl
          ? _value.languageUrl
          : languageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<File>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      blocked: null == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool,
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      parodys: null == parodys
          ? _value.parodys
          : parodys // ignore: cast_nullable_to_non_nullable
              as List<Parody>,
      related: null == related
          ? _value.related
          : related // ignore: cast_nullable_to_non_nullable
              as List<int>,
      galleryUrl: null == galleryUrl
          ? _value.galleryUrl
          : galleryUrl // ignore: cast_nullable_to_non_nullable
              as String,
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<Artist>,
      videoFilename: freezed == videoFilename
          ? _value.videoFilename
          : videoFilename // ignore: cast_nullable_to_non_nullable
              as String?,
      characters: null == characters
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<Character>,
      languageLocalname: freezed == languageLocalname
          ? _value.languageLocalname
          : languageLocalname // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      sceneIndexes: null == sceneIndexes
          ? _value.sceneIndexes
          : sceneIndexes // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GalleryImplCopyWith<$Res> implements $GalleryCopyWith<$Res> {
  factory _$$GalleryImplCopyWith(
          _$GalleryImpl value, $Res Function(_$GalleryImpl) then) =
      __$$GalleryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      String? video,
      @JsonKey(name: 'japanese_title') String? japaneseTitle,
      String? language,
      @JsonKey(name: 'language_url') String? languageUrl,
      List<Language> languages,
      String date,
      List<File> files,
      @GalleryIdConverter() int id,
      @BoolConverter() bool blocked,
      List<Group> groups,
      String title,
      List<Parody> parodys,
      @IDListConverter() List<int> related,
      @JsonKey(name: 'galleryurl') String galleryUrl,
      List<Artist> artists,
      @JsonKey(name: 'videofilename') String? videoFilename,
      List<Character> characters,
      @JsonKey(name: 'language_localname') String? languageLocalname,
      List<Tag> tags,
      @IDListConverter() List<int> sceneIndexes});
}

/// @nodoc
class __$$GalleryImplCopyWithImpl<$Res>
    extends _$GalleryCopyWithImpl<$Res, _$GalleryImpl>
    implements _$$GalleryImplCopyWith<$Res> {
  __$$GalleryImplCopyWithImpl(
      _$GalleryImpl _value, $Res Function(_$GalleryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Gallery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? video = freezed,
    Object? japaneseTitle = freezed,
    Object? language = freezed,
    Object? languageUrl = freezed,
    Object? languages = null,
    Object? date = null,
    Object? files = null,
    Object? id = null,
    Object? blocked = null,
    Object? groups = null,
    Object? title = null,
    Object? parodys = null,
    Object? related = null,
    Object? galleryUrl = null,
    Object? artists = null,
    Object? videoFilename = freezed,
    Object? characters = null,
    Object? languageLocalname = freezed,
    Object? tags = null,
    Object? sceneIndexes = null,
  }) {
    return _then(_$GalleryImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      japaneseTitle: freezed == japaneseTitle
          ? _value.japaneseTitle
          : japaneseTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      languageUrl: freezed == languageUrl
          ? _value.languageUrl
          : languageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: null == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<File>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      blocked: null == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool,
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      parodys: null == parodys
          ? _value._parodys
          : parodys // ignore: cast_nullable_to_non_nullable
              as List<Parody>,
      related: null == related
          ? _value._related
          : related // ignore: cast_nullable_to_non_nullable
              as List<int>,
      galleryUrl: null == galleryUrl
          ? _value.galleryUrl
          : galleryUrl // ignore: cast_nullable_to_non_nullable
              as String,
      artists: null == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<Artist>,
      videoFilename: freezed == videoFilename
          ? _value.videoFilename
          : videoFilename // ignore: cast_nullable_to_non_nullable
              as String?,
      characters: null == characters
          ? _value._characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<Character>,
      languageLocalname: freezed == languageLocalname
          ? _value.languageLocalname
          : languageLocalname // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      sceneIndexes: null == sceneIndexes
          ? _value._sceneIndexes
          : sceneIndexes // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GalleryImpl extends _Gallery {
  _$GalleryImpl(
      {required this.type,
      this.video,
      @JsonKey(name: 'japanese_title') this.japaneseTitle,
      this.language,
      @JsonKey(name: 'language_url') this.languageUrl,
      final List<Language> languages = const [],
      required this.date,
      final List<File> files = const [],
      @GalleryIdConverter() required this.id,
      @BoolConverter() this.blocked = false,
      final List<Group> groups = const [],
      required this.title,
      final List<Parody> parodys = const [],
      @IDListConverter() required final List<int> related,
      @JsonKey(name: 'galleryurl') required this.galleryUrl,
      final List<Artist> artists = const [],
      @JsonKey(name: 'videofilename') this.videoFilename,
      final List<Character> characters = const [],
      @JsonKey(name: 'language_localname') this.languageLocalname,
      final List<Tag> tags = const [],
      @IDListConverter() required final List<int> sceneIndexes})
      : _languages = languages,
        _files = files,
        _groups = groups,
        _parodys = parodys,
        _related = related,
        _artists = artists,
        _characters = characters,
        _tags = tags,
        _sceneIndexes = sceneIndexes,
        super._();

  factory _$GalleryImpl.fromJson(Map<String, dynamic> json) =>
      _$$GalleryImplFromJson(json);

  @override
  final String type;
  @override
  final String? video;
  @override
  @JsonKey(name: 'japanese_title')
  final String? japaneseTitle;
  @override
  final String? language;
  @override
  @JsonKey(name: 'language_url')
  final String? languageUrl;
  final List<Language> _languages;
  @override
  @JsonKey()
  List<Language> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  @override
  final String date;
  final List<File> _files;
  @override
  @JsonKey()
  List<File> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  @GalleryIdConverter()
  final int id;
  @override
  @JsonKey()
  @BoolConverter()
  final bool blocked;
  final List<Group> _groups;
  @override
  @JsonKey()
  List<Group> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  final String title;
  final List<Parody> _parodys;
  @override
  @JsonKey()
  List<Parody> get parodys {
    if (_parodys is EqualUnmodifiableListView) return _parodys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parodys);
  }

  final List<int> _related;
  @override
  @IDListConverter()
  List<int> get related {
    if (_related is EqualUnmodifiableListView) return _related;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_related);
  }

  @override
  @JsonKey(name: 'galleryurl')
  final String galleryUrl;
  final List<Artist> _artists;
  @override
  @JsonKey()
  List<Artist> get artists {
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  @override
  @JsonKey(name: 'videofilename')
  final String? videoFilename;
  final List<Character> _characters;
  @override
  @JsonKey()
  List<Character> get characters {
    if (_characters is EqualUnmodifiableListView) return _characters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characters);
  }

  @override
  @JsonKey(name: 'language_localname')
  final String? languageLocalname;
  final List<Tag> _tags;
  @override
  @JsonKey()
  List<Tag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<int> _sceneIndexes;
  @override
  @IDListConverter()
  List<int> get sceneIndexes {
    if (_sceneIndexes is EqualUnmodifiableListView) return _sceneIndexes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sceneIndexes);
  }

  @override
  String toString() {
    return 'Gallery(type: $type, video: $video, japaneseTitle: $japaneseTitle, language: $language, languageUrl: $languageUrl, languages: $languages, date: $date, files: $files, id: $id, blocked: $blocked, groups: $groups, title: $title, parodys: $parodys, related: $related, galleryUrl: $galleryUrl, artists: $artists, videoFilename: $videoFilename, characters: $characters, languageLocalname: $languageLocalname, tags: $tags, sceneIndexes: $sceneIndexes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.japaneseTitle, japaneseTitle) ||
                other.japaneseTitle == japaneseTitle) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.languageUrl, languageUrl) ||
                other.languageUrl == languageUrl) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._parodys, _parodys) &&
            const DeepCollectionEquality().equals(other._related, _related) &&
            (identical(other.galleryUrl, galleryUrl) ||
                other.galleryUrl == galleryUrl) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            (identical(other.videoFilename, videoFilename) ||
                other.videoFilename == videoFilename) &&
            const DeepCollectionEquality()
                .equals(other._characters, _characters) &&
            (identical(other.languageLocalname, languageLocalname) ||
                other.languageLocalname == languageLocalname) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._sceneIndexes, _sceneIndexes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        type,
        video,
        japaneseTitle,
        language,
        languageUrl,
        const DeepCollectionEquality().hash(_languages),
        date,
        const DeepCollectionEquality().hash(_files),
        id,
        blocked,
        const DeepCollectionEquality().hash(_groups),
        title,
        const DeepCollectionEquality().hash(_parodys),
        const DeepCollectionEquality().hash(_related),
        galleryUrl,
        const DeepCollectionEquality().hash(_artists),
        videoFilename,
        const DeepCollectionEquality().hash(_characters),
        languageLocalname,
        const DeepCollectionEquality().hash(_tags),
        const DeepCollectionEquality().hash(_sceneIndexes)
      ]);

  /// Create a copy of Gallery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GalleryImplCopyWith<_$GalleryImpl> get copyWith =>
      __$$GalleryImplCopyWithImpl<_$GalleryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GalleryImplToJson(
      this,
    );
  }
}

abstract class _Gallery extends Gallery {
  factory _Gallery(
          {required final String type,
          final String? video,
          @JsonKey(name: 'japanese_title') final String? japaneseTitle,
          final String? language,
          @JsonKey(name: 'language_url') final String? languageUrl,
          final List<Language> languages,
          required final String date,
          final List<File> files,
          @GalleryIdConverter() required final int id,
          @BoolConverter() final bool blocked,
          final List<Group> groups,
          required final String title,
          final List<Parody> parodys,
          @IDListConverter() required final List<int> related,
          @JsonKey(name: 'galleryurl') required final String galleryUrl,
          final List<Artist> artists,
          @JsonKey(name: 'videofilename') final String? videoFilename,
          final List<Character> characters,
          @JsonKey(name: 'language_localname') final String? languageLocalname,
          final List<Tag> tags,
          @IDListConverter() required final List<int> sceneIndexes}) =
      _$GalleryImpl;
  _Gallery._() : super._();

  factory _Gallery.fromJson(Map<String, dynamic> json) = _$GalleryImpl.fromJson;

  @override
  String get type;
  @override
  String? get video;
  @override
  @JsonKey(name: 'japanese_title')
  String? get japaneseTitle;
  @override
  String? get language;
  @override
  @JsonKey(name: 'language_url')
  String? get languageUrl;
  @override
  List<Language> get languages;
  @override
  String get date;
  @override
  List<File> get files;
  @override
  @GalleryIdConverter()
  int get id;
  @override
  @BoolConverter()
  bool get blocked;
  @override
  List<Group> get groups;
  @override
  String get title;
  @override
  List<Parody> get parodys;
  @override
  @IDListConverter()
  List<int> get related;
  @override
  @JsonKey(name: 'galleryurl')
  String get galleryUrl;
  @override
  List<Artist> get artists;
  @override
  @JsonKey(name: 'videofilename')
  String? get videoFilename;
  @override
  List<Character> get characters;
  @override
  @JsonKey(name: 'language_localname')
  String? get languageLocalname;
  @override
  List<Tag> get tags;
  @override
  @IDListConverter()
  List<int> get sceneIndexes;

  /// Create a copy of Gallery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GalleryImplCopyWith<_$GalleryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
