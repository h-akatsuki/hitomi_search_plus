// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'export.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookmarkExportItem _$BookmarkExportItemFromJson(Map<String, dynamic> json) {
  return _BookmarkExportItem.fromJson(json);
}

/// @nodoc
mixin _$BookmarkExportItem {
  int get id => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  String get defaultQuery => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int get addedAt => throw _privateConstructorUsedError;

  /// Serializes this BookmarkExportItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookmarkExportItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookmarkExportItemCopyWith<BookmarkExportItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkExportItemCopyWith<$Res> {
  factory $BookmarkExportItemCopyWith(
          BookmarkExportItem value, $Res Function(BookmarkExportItem) then) =
      _$BookmarkExportItemCopyWithImpl<$Res, BookmarkExportItem>;
  @useResult
  $Res call(
      {int id, String query, String defaultQuery, String? title, int addedAt});
}

/// @nodoc
class _$BookmarkExportItemCopyWithImpl<$Res, $Val extends BookmarkExportItem>
    implements $BookmarkExportItemCopyWith<$Res> {
  _$BookmarkExportItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookmarkExportItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? query = null,
    Object? defaultQuery = null,
    Object? title = freezed,
    Object? addedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      defaultQuery: null == defaultQuery
          ? _value.defaultQuery
          : defaultQuery // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookmarkExportItemImplCopyWith<$Res>
    implements $BookmarkExportItemCopyWith<$Res> {
  factory _$$BookmarkExportItemImplCopyWith(_$BookmarkExportItemImpl value,
          $Res Function(_$BookmarkExportItemImpl) then) =
      __$$BookmarkExportItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String query, String defaultQuery, String? title, int addedAt});
}

/// @nodoc
class __$$BookmarkExportItemImplCopyWithImpl<$Res>
    extends _$BookmarkExportItemCopyWithImpl<$Res, _$BookmarkExportItemImpl>
    implements _$$BookmarkExportItemImplCopyWith<$Res> {
  __$$BookmarkExportItemImplCopyWithImpl(_$BookmarkExportItemImpl _value,
      $Res Function(_$BookmarkExportItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookmarkExportItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? query = null,
    Object? defaultQuery = null,
    Object? title = freezed,
    Object? addedAt = null,
  }) {
    return _then(_$BookmarkExportItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      defaultQuery: null == defaultQuery
          ? _value.defaultQuery
          : defaultQuery // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookmarkExportItemImpl extends _BookmarkExportItem
    with DiagnosticableTreeMixin {
  _$BookmarkExportItemImpl(
      {required this.id,
      required this.query,
      required this.defaultQuery,
      required this.title,
      required this.addedAt})
      : super._();

  factory _$BookmarkExportItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookmarkExportItemImplFromJson(json);

  @override
  final int id;
  @override
  final String query;
  @override
  final String defaultQuery;
  @override
  final String? title;
  @override
  final int addedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookmarkExportItem(id: $id, query: $query, defaultQuery: $defaultQuery, title: $title, addedAt: $addedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BookmarkExportItem'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('query', query))
      ..add(DiagnosticsProperty('defaultQuery', defaultQuery))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('addedAt', addedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkExportItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.defaultQuery, defaultQuery) ||
                other.defaultQuery == defaultQuery) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, query, defaultQuery, title, addedAt);

  /// Create a copy of BookmarkExportItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkExportItemImplCopyWith<_$BookmarkExportItemImpl> get copyWith =>
      __$$BookmarkExportItemImplCopyWithImpl<_$BookmarkExportItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookmarkExportItemImplToJson(
      this,
    );
  }
}

abstract class _BookmarkExportItem extends BookmarkExportItem {
  factory _BookmarkExportItem(
      {required final int id,
      required final String query,
      required final String defaultQuery,
      required final String? title,
      required final int addedAt}) = _$BookmarkExportItemImpl;
  _BookmarkExportItem._() : super._();

  factory _BookmarkExportItem.fromJson(Map<String, dynamic> json) =
      _$BookmarkExportItemImpl.fromJson;

  @override
  int get id;
  @override
  String get query;
  @override
  String get defaultQuery;
  @override
  String? get title;
  @override
  int get addedAt;

  /// Create a copy of BookmarkExportItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookmarkExportItemImplCopyWith<_$BookmarkExportItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookmarkExport _$BookmarkExportFromJson(Map<String, dynamic> json) {
  return _BookmarkExport.fromJson(json);
}

/// @nodoc
mixin _$BookmarkExport {
  List<BookmarkExportItem> get items => throw _privateConstructorUsedError;

  /// Serializes this BookmarkExport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookmarkExport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookmarkExportCopyWith<BookmarkExport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkExportCopyWith<$Res> {
  factory $BookmarkExportCopyWith(
          BookmarkExport value, $Res Function(BookmarkExport) then) =
      _$BookmarkExportCopyWithImpl<$Res, BookmarkExport>;
  @useResult
  $Res call({List<BookmarkExportItem> items});
}

/// @nodoc
class _$BookmarkExportCopyWithImpl<$Res, $Val extends BookmarkExport>
    implements $BookmarkExportCopyWith<$Res> {
  _$BookmarkExportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookmarkExport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BookmarkExportItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookmarkExportImplCopyWith<$Res>
    implements $BookmarkExportCopyWith<$Res> {
  factory _$$BookmarkExportImplCopyWith(_$BookmarkExportImpl value,
          $Res Function(_$BookmarkExportImpl) then) =
      __$$BookmarkExportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BookmarkExportItem> items});
}

/// @nodoc
class __$$BookmarkExportImplCopyWithImpl<$Res>
    extends _$BookmarkExportCopyWithImpl<$Res, _$BookmarkExportImpl>
    implements _$$BookmarkExportImplCopyWith<$Res> {
  __$$BookmarkExportImplCopyWithImpl(
      _$BookmarkExportImpl _value, $Res Function(_$BookmarkExportImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookmarkExport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$BookmarkExportImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BookmarkExportItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookmarkExportImpl extends _BookmarkExport
    with DiagnosticableTreeMixin {
  _$BookmarkExportImpl({required final List<BookmarkExportItem> items})
      : _items = items,
        super._();

  factory _$BookmarkExportImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookmarkExportImplFromJson(json);

  final List<BookmarkExportItem> _items;
  @override
  List<BookmarkExportItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookmarkExport(items: $items)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BookmarkExport'))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkExportImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of BookmarkExport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkExportImplCopyWith<_$BookmarkExportImpl> get copyWith =>
      __$$BookmarkExportImplCopyWithImpl<_$BookmarkExportImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookmarkExportImplToJson(
      this,
    );
  }
}

abstract class _BookmarkExport extends BookmarkExport {
  factory _BookmarkExport({required final List<BookmarkExportItem> items}) =
      _$BookmarkExportImpl;
  _BookmarkExport._() : super._();

  factory _BookmarkExport.fromJson(Map<String, dynamic> json) =
      _$BookmarkExportImpl.fromJson;

  @override
  List<BookmarkExportItem> get items;

  /// Create a copy of BookmarkExport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookmarkExportImplCopyWith<_$BookmarkExportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LikeExportItem _$LikeExportItemFromJson(Map<String, dynamic> json) {
  return _LikeExportItem.fromJson(json);
}

/// @nodoc
mixin _$LikeExportItem {
  int get id => throw _privateConstructorUsedError;
  int get addedAt => throw _privateConstructorUsedError;

  /// Serializes this LikeExportItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LikeExportItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LikeExportItemCopyWith<LikeExportItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeExportItemCopyWith<$Res> {
  factory $LikeExportItemCopyWith(
          LikeExportItem value, $Res Function(LikeExportItem) then) =
      _$LikeExportItemCopyWithImpl<$Res, LikeExportItem>;
  @useResult
  $Res call({int id, int addedAt});
}

/// @nodoc
class _$LikeExportItemCopyWithImpl<$Res, $Val extends LikeExportItem>
    implements $LikeExportItemCopyWith<$Res> {
  _$LikeExportItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LikeExportItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? addedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LikeExportItemImplCopyWith<$Res>
    implements $LikeExportItemCopyWith<$Res> {
  factory _$$LikeExportItemImplCopyWith(_$LikeExportItemImpl value,
          $Res Function(_$LikeExportItemImpl) then) =
      __$$LikeExportItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int addedAt});
}

/// @nodoc
class __$$LikeExportItemImplCopyWithImpl<$Res>
    extends _$LikeExportItemCopyWithImpl<$Res, _$LikeExportItemImpl>
    implements _$$LikeExportItemImplCopyWith<$Res> {
  __$$LikeExportItemImplCopyWithImpl(
      _$LikeExportItemImpl _value, $Res Function(_$LikeExportItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of LikeExportItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? addedAt = null,
  }) {
    return _then(_$LikeExportItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LikeExportItemImpl extends _LikeExportItem
    with DiagnosticableTreeMixin {
  _$LikeExportItemImpl({required this.id, required this.addedAt}) : super._();

  factory _$LikeExportItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$LikeExportItemImplFromJson(json);

  @override
  final int id;
  @override
  final int addedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LikeExportItem(id: $id, addedAt: $addedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LikeExportItem'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('addedAt', addedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeExportItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, addedAt);

  /// Create a copy of LikeExportItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeExportItemImplCopyWith<_$LikeExportItemImpl> get copyWith =>
      __$$LikeExportItemImplCopyWithImpl<_$LikeExportItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LikeExportItemImplToJson(
      this,
    );
  }
}

abstract class _LikeExportItem extends LikeExportItem {
  factory _LikeExportItem({required final int id, required final int addedAt}) =
      _$LikeExportItemImpl;
  _LikeExportItem._() : super._();

  factory _LikeExportItem.fromJson(Map<String, dynamic> json) =
      _$LikeExportItemImpl.fromJson;

  @override
  int get id;
  @override
  int get addedAt;

  /// Create a copy of LikeExportItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LikeExportItemImplCopyWith<_$LikeExportItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExportData _$ExportDataFromJson(Map<String, dynamic> json) {
  return _ExportData.fromJson(json);
}

/// @nodoc
mixin _$ExportData {
  BookmarkExport get bookmarks => throw _privateConstructorUsedError;
  DefaultQueryList get defaultQueryList => throw _privateConstructorUsedError;
  List<LikeExportItem> get likes => throw _privateConstructorUsedError;

  /// Serializes this ExportData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExportData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExportDataCopyWith<ExportData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExportDataCopyWith<$Res> {
  factory $ExportDataCopyWith(
          ExportData value, $Res Function(ExportData) then) =
      _$ExportDataCopyWithImpl<$Res, ExportData>;
  @useResult
  $Res call(
      {BookmarkExport bookmarks,
      DefaultQueryList defaultQueryList,
      List<LikeExportItem> likes});

  $BookmarkExportCopyWith<$Res> get bookmarks;
  $DefaultQueryListCopyWith<$Res> get defaultQueryList;
}

/// @nodoc
class _$ExportDataCopyWithImpl<$Res, $Val extends ExportData>
    implements $ExportDataCopyWith<$Res> {
  _$ExportDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExportData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarks = null,
    Object? defaultQueryList = null,
    Object? likes = null,
  }) {
    return _then(_value.copyWith(
      bookmarks: null == bookmarks
          ? _value.bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as BookmarkExport,
      defaultQueryList: null == defaultQueryList
          ? _value.defaultQueryList
          : defaultQueryList // ignore: cast_nullable_to_non_nullable
              as DefaultQueryList,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<LikeExportItem>,
    ) as $Val);
  }

  /// Create a copy of ExportData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookmarkExportCopyWith<$Res> get bookmarks {
    return $BookmarkExportCopyWith<$Res>(_value.bookmarks, (value) {
      return _then(_value.copyWith(bookmarks: value) as $Val);
    });
  }

  /// Create a copy of ExportData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DefaultQueryListCopyWith<$Res> get defaultQueryList {
    return $DefaultQueryListCopyWith<$Res>(_value.defaultQueryList, (value) {
      return _then(_value.copyWith(defaultQueryList: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExportDataImplCopyWith<$Res>
    implements $ExportDataCopyWith<$Res> {
  factory _$$ExportDataImplCopyWith(
          _$ExportDataImpl value, $Res Function(_$ExportDataImpl) then) =
      __$$ExportDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BookmarkExport bookmarks,
      DefaultQueryList defaultQueryList,
      List<LikeExportItem> likes});

  @override
  $BookmarkExportCopyWith<$Res> get bookmarks;
  @override
  $DefaultQueryListCopyWith<$Res> get defaultQueryList;
}

/// @nodoc
class __$$ExportDataImplCopyWithImpl<$Res>
    extends _$ExportDataCopyWithImpl<$Res, _$ExportDataImpl>
    implements _$$ExportDataImplCopyWith<$Res> {
  __$$ExportDataImplCopyWithImpl(
      _$ExportDataImpl _value, $Res Function(_$ExportDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExportData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarks = null,
    Object? defaultQueryList = null,
    Object? likes = null,
  }) {
    return _then(_$ExportDataImpl(
      bookmarks: null == bookmarks
          ? _value.bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as BookmarkExport,
      defaultQueryList: null == defaultQueryList
          ? _value.defaultQueryList
          : defaultQueryList // ignore: cast_nullable_to_non_nullable
              as DefaultQueryList,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<LikeExportItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExportDataImpl extends _ExportData with DiagnosticableTreeMixin {
  _$ExportDataImpl(
      {required this.bookmarks,
      required this.defaultQueryList,
      required final List<LikeExportItem> likes})
      : _likes = likes,
        super._();

  factory _$ExportDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExportDataImplFromJson(json);

  @override
  final BookmarkExport bookmarks;
  @override
  final DefaultQueryList defaultQueryList;
  final List<LikeExportItem> _likes;
  @override
  List<LikeExportItem> get likes {
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExportData(bookmarks: $bookmarks, defaultQueryList: $defaultQueryList, likes: $likes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExportData'))
      ..add(DiagnosticsProperty('bookmarks', bookmarks))
      ..add(DiagnosticsProperty('defaultQueryList', defaultQueryList))
      ..add(DiagnosticsProperty('likes', likes));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExportDataImpl &&
            (identical(other.bookmarks, bookmarks) ||
                other.bookmarks == bookmarks) &&
            (identical(other.defaultQueryList, defaultQueryList) ||
                other.defaultQueryList == defaultQueryList) &&
            const DeepCollectionEquality().equals(other._likes, _likes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bookmarks, defaultQueryList,
      const DeepCollectionEquality().hash(_likes));

  /// Create a copy of ExportData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExportDataImplCopyWith<_$ExportDataImpl> get copyWith =>
      __$$ExportDataImplCopyWithImpl<_$ExportDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExportDataImplToJson(
      this,
    );
  }
}

abstract class _ExportData extends ExportData {
  factory _ExportData(
      {required final BookmarkExport bookmarks,
      required final DefaultQueryList defaultQueryList,
      required final List<LikeExportItem> likes}) = _$ExportDataImpl;
  _ExportData._() : super._();

  factory _ExportData.fromJson(Map<String, dynamic> json) =
      _$ExportDataImpl.fromJson;

  @override
  BookmarkExport get bookmarks;
  @override
  DefaultQueryList get defaultQueryList;
  @override
  List<LikeExportItem> get likes;

  /// Create a copy of ExportData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExportDataImplCopyWith<_$ExportDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DataSyncs {
  SyncState get upload => throw _privateConstructorUsedError;
  SyncState get download => throw _privateConstructorUsedError;

  /// Create a copy of DataSyncs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataSyncsCopyWith<DataSyncs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataSyncsCopyWith<$Res> {
  factory $DataSyncsCopyWith(DataSyncs value, $Res Function(DataSyncs) then) =
      _$DataSyncsCopyWithImpl<$Res, DataSyncs>;
  @useResult
  $Res call({SyncState upload, SyncState download});
}

/// @nodoc
class _$DataSyncsCopyWithImpl<$Res, $Val extends DataSyncs>
    implements $DataSyncsCopyWith<$Res> {
  _$DataSyncsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataSyncs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? upload = null,
    Object? download = null,
  }) {
    return _then(_value.copyWith(
      upload: null == upload
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as SyncState,
      download: null == download
          ? _value.download
          : download // ignore: cast_nullable_to_non_nullable
              as SyncState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataSyncsImplCopyWith<$Res>
    implements $DataSyncsCopyWith<$Res> {
  factory _$$DataSyncsImplCopyWith(
          _$DataSyncsImpl value, $Res Function(_$DataSyncsImpl) then) =
      __$$DataSyncsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SyncState upload, SyncState download});
}

/// @nodoc
class __$$DataSyncsImplCopyWithImpl<$Res>
    extends _$DataSyncsCopyWithImpl<$Res, _$DataSyncsImpl>
    implements _$$DataSyncsImplCopyWith<$Res> {
  __$$DataSyncsImplCopyWithImpl(
      _$DataSyncsImpl _value, $Res Function(_$DataSyncsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataSyncs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? upload = null,
    Object? download = null,
  }) {
    return _then(_$DataSyncsImpl(
      upload: null == upload
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as SyncState,
      download: null == download
          ? _value.download
          : download // ignore: cast_nullable_to_non_nullable
              as SyncState,
    ));
  }
}

/// @nodoc

class _$DataSyncsImpl with DiagnosticableTreeMixin implements _DataSyncs {
  _$DataSyncsImpl({required this.upload, required this.download});

  @override
  final SyncState upload;
  @override
  final SyncState download;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DataSyncs(upload: $upload, download: $download)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DataSyncs'))
      ..add(DiagnosticsProperty('upload', upload))
      ..add(DiagnosticsProperty('download', download));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataSyncsImpl &&
            (identical(other.upload, upload) || other.upload == upload) &&
            (identical(other.download, download) ||
                other.download == download));
  }

  @override
  int get hashCode => Object.hash(runtimeType, upload, download);

  /// Create a copy of DataSyncs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataSyncsImplCopyWith<_$DataSyncsImpl> get copyWith =>
      __$$DataSyncsImplCopyWithImpl<_$DataSyncsImpl>(this, _$identity);
}

abstract class _DataSyncs implements DataSyncs {
  factory _DataSyncs(
      {required final SyncState upload,
      required final SyncState download}) = _$DataSyncsImpl;

  @override
  SyncState get upload;
  @override
  SyncState get download;

  /// Create a copy of DataSyncs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataSyncsImplCopyWith<_$DataSyncsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
