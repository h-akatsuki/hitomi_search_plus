// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'default_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DefaultQueryList _$DefaultQueryListFromJson(Map<String, dynamic> json) {
  return _DefaultQueryList.fromJson(json);
}

/// @nodoc
mixin _$DefaultQueryList {
  int get nextId => throw _privateConstructorUsedError;
  List<DefaultQuery> get queries => throw _privateConstructorUsedError;

  /// Serializes this DefaultQueryList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DefaultQueryList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DefaultQueryListCopyWith<DefaultQueryList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultQueryListCopyWith<$Res> {
  factory $DefaultQueryListCopyWith(
          DefaultQueryList value, $Res Function(DefaultQueryList) then) =
      _$DefaultQueryListCopyWithImpl<$Res, DefaultQueryList>;
  @useResult
  $Res call({int nextId, List<DefaultQuery> queries});
}

/// @nodoc
class _$DefaultQueryListCopyWithImpl<$Res, $Val extends DefaultQueryList>
    implements $DefaultQueryListCopyWith<$Res> {
  _$DefaultQueryListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DefaultQueryList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextId = null,
    Object? queries = null,
  }) {
    return _then(_value.copyWith(
      nextId: null == nextId
          ? _value.nextId
          : nextId // ignore: cast_nullable_to_non_nullable
              as int,
      queries: null == queries
          ? _value.queries
          : queries // ignore: cast_nullable_to_non_nullable
              as List<DefaultQuery>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DefaultQueryListImplCopyWith<$Res>
    implements $DefaultQueryListCopyWith<$Res> {
  factory _$$DefaultQueryListImplCopyWith(_$DefaultQueryListImpl value,
          $Res Function(_$DefaultQueryListImpl) then) =
      __$$DefaultQueryListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int nextId, List<DefaultQuery> queries});
}

/// @nodoc
class __$$DefaultQueryListImplCopyWithImpl<$Res>
    extends _$DefaultQueryListCopyWithImpl<$Res, _$DefaultQueryListImpl>
    implements _$$DefaultQueryListImplCopyWith<$Res> {
  __$$DefaultQueryListImplCopyWithImpl(_$DefaultQueryListImpl _value,
      $Res Function(_$DefaultQueryListImpl) _then)
      : super(_value, _then);

  /// Create a copy of DefaultQueryList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextId = null,
    Object? queries = null,
  }) {
    return _then(_$DefaultQueryListImpl(
      nextId: null == nextId
          ? _value.nextId
          : nextId // ignore: cast_nullable_to_non_nullable
              as int,
      queries: null == queries
          ? _value._queries
          : queries // ignore: cast_nullable_to_non_nullable
              as List<DefaultQuery>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DefaultQueryListImpl implements _DefaultQueryList {
  _$DefaultQueryListImpl(
      {required this.nextId, required final List<DefaultQuery> queries})
      : _queries = queries;

  factory _$DefaultQueryListImpl.fromJson(Map<String, dynamic> json) =>
      _$$DefaultQueryListImplFromJson(json);

  @override
  final int nextId;
  final List<DefaultQuery> _queries;
  @override
  List<DefaultQuery> get queries {
    if (_queries is EqualUnmodifiableListView) return _queries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queries);
  }

  @override
  String toString() {
    return 'DefaultQueryList(nextId: $nextId, queries: $queries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefaultQueryListImpl &&
            (identical(other.nextId, nextId) || other.nextId == nextId) &&
            const DeepCollectionEquality().equals(other._queries, _queries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, nextId, const DeepCollectionEquality().hash(_queries));

  /// Create a copy of DefaultQueryList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DefaultQueryListImplCopyWith<_$DefaultQueryListImpl> get copyWith =>
      __$$DefaultQueryListImplCopyWithImpl<_$DefaultQueryListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DefaultQueryListImplToJson(
      this,
    );
  }
}

abstract class _DefaultQueryList implements DefaultQueryList {
  factory _DefaultQueryList(
      {required final int nextId,
      required final List<DefaultQuery> queries}) = _$DefaultQueryListImpl;

  factory _DefaultQueryList.fromJson(Map<String, dynamic> json) =
      _$DefaultQueryListImpl.fromJson;

  @override
  int get nextId;
  @override
  List<DefaultQuery> get queries;

  /// Create a copy of DefaultQueryList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DefaultQueryListImplCopyWith<_$DefaultQueryListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DefaultQuery _$DefaultQueryFromJson(Map<String, dynamic> json) {
  return _DefaultQuery.fromJson(json);
}

/// @nodoc
mixin _$DefaultQuery {
  int get id => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get defaultValue => throw _privateConstructorUsedError;

  /// Serializes this DefaultQuery to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DefaultQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DefaultQueryCopyWith<DefaultQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultQueryCopyWith<$Res> {
  factory $DefaultQueryCopyWith(
          DefaultQuery value, $Res Function(DefaultQuery) then) =
      _$DefaultQueryCopyWithImpl<$Res, DefaultQuery>;
  @useResult
  $Res call({int id, String query, String title, bool defaultValue});
}

/// @nodoc
class _$DefaultQueryCopyWithImpl<$Res, $Val extends DefaultQuery>
    implements $DefaultQueryCopyWith<$Res> {
  _$DefaultQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DefaultQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? query = null,
    Object? title = null,
    Object? defaultValue = null,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      defaultValue: null == defaultValue
          ? _value.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DefaultQueryImplCopyWith<$Res>
    implements $DefaultQueryCopyWith<$Res> {
  factory _$$DefaultQueryImplCopyWith(
          _$DefaultQueryImpl value, $Res Function(_$DefaultQueryImpl) then) =
      __$$DefaultQueryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String query, String title, bool defaultValue});
}

/// @nodoc
class __$$DefaultQueryImplCopyWithImpl<$Res>
    extends _$DefaultQueryCopyWithImpl<$Res, _$DefaultQueryImpl>
    implements _$$DefaultQueryImplCopyWith<$Res> {
  __$$DefaultQueryImplCopyWithImpl(
      _$DefaultQueryImpl _value, $Res Function(_$DefaultQueryImpl) _then)
      : super(_value, _then);

  /// Create a copy of DefaultQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? query = null,
    Object? title = null,
    Object? defaultValue = null,
  }) {
    return _then(_$DefaultQueryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      defaultValue: null == defaultValue
          ? _value.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DefaultQueryImpl implements _DefaultQuery {
  _$DefaultQueryImpl(
      {required this.id,
      required this.query,
      required this.title,
      required this.defaultValue});

  factory _$DefaultQueryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DefaultQueryImplFromJson(json);

  @override
  final int id;
  @override
  final String query;
  @override
  final String title;
  @override
  final bool defaultValue;

  @override
  String toString() {
    return 'DefaultQuery(id: $id, query: $query, title: $title, defaultValue: $defaultValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefaultQueryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.defaultValue, defaultValue) ||
                other.defaultValue == defaultValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, query, title, defaultValue);

  /// Create a copy of DefaultQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DefaultQueryImplCopyWith<_$DefaultQueryImpl> get copyWith =>
      __$$DefaultQueryImplCopyWithImpl<_$DefaultQueryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DefaultQueryImplToJson(
      this,
    );
  }
}

abstract class _DefaultQuery implements DefaultQuery {
  factory _DefaultQuery(
      {required final int id,
      required final String query,
      required final String title,
      required final bool defaultValue}) = _$DefaultQueryImpl;

  factory _DefaultQuery.fromJson(Map<String, dynamic> json) =
      _$DefaultQueryImpl.fromJson;

  @override
  int get id;
  @override
  String get query;
  @override
  String get title;
  @override
  bool get defaultValue;

  /// Create a copy of DefaultQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DefaultQueryImplCopyWith<_$DefaultQueryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SelectDefaultQuery _$SelectDefaultQueryFromJson(Map<String, dynamic> json) {
  return _SelectDefaultQuery.fromJson(json);
}

/// @nodoc
mixin _$SelectDefaultQuery {
  List<int> get selected => throw _privateConstructorUsedError;
  int get newestId => throw _privateConstructorUsedError;

  /// Serializes this SelectDefaultQuery to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SelectDefaultQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SelectDefaultQueryCopyWith<SelectDefaultQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectDefaultQueryCopyWith<$Res> {
  factory $SelectDefaultQueryCopyWith(
          SelectDefaultQuery value, $Res Function(SelectDefaultQuery) then) =
      _$SelectDefaultQueryCopyWithImpl<$Res, SelectDefaultQuery>;
  @useResult
  $Res call({List<int> selected, int newestId});
}

/// @nodoc
class _$SelectDefaultQueryCopyWithImpl<$Res, $Val extends SelectDefaultQuery>
    implements $SelectDefaultQueryCopyWith<$Res> {
  _$SelectDefaultQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SelectDefaultQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selected = null,
    Object? newestId = null,
  }) {
    return _then(_value.copyWith(
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as List<int>,
      newestId: null == newestId
          ? _value.newestId
          : newestId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectDefaultQueryImplCopyWith<$Res>
    implements $SelectDefaultQueryCopyWith<$Res> {
  factory _$$SelectDefaultQueryImplCopyWith(_$SelectDefaultQueryImpl value,
          $Res Function(_$SelectDefaultQueryImpl) then) =
      __$$SelectDefaultQueryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> selected, int newestId});
}

/// @nodoc
class __$$SelectDefaultQueryImplCopyWithImpl<$Res>
    extends _$SelectDefaultQueryCopyWithImpl<$Res, _$SelectDefaultQueryImpl>
    implements _$$SelectDefaultQueryImplCopyWith<$Res> {
  __$$SelectDefaultQueryImplCopyWithImpl(_$SelectDefaultQueryImpl _value,
      $Res Function(_$SelectDefaultQueryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SelectDefaultQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selected = null,
    Object? newestId = null,
  }) {
    return _then(_$SelectDefaultQueryImpl(
      null == selected
          ? _value._selected
          : selected // ignore: cast_nullable_to_non_nullable
              as List<int>,
      null == newestId
          ? _value.newestId
          : newestId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectDefaultQueryImpl implements _SelectDefaultQuery {
  const _$SelectDefaultQueryImpl(final List<int> selected, this.newestId)
      : _selected = selected;

  factory _$SelectDefaultQueryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectDefaultQueryImplFromJson(json);

  final List<int> _selected;
  @override
  List<int> get selected {
    if (_selected is EqualUnmodifiableListView) return _selected;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selected);
  }

  @override
  final int newestId;

  @override
  String toString() {
    return 'SelectDefaultQuery(selected: $selected, newestId: $newestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectDefaultQueryImpl &&
            const DeepCollectionEquality().equals(other._selected, _selected) &&
            (identical(other.newestId, newestId) ||
                other.newestId == newestId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_selected), newestId);

  /// Create a copy of SelectDefaultQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectDefaultQueryImplCopyWith<_$SelectDefaultQueryImpl> get copyWith =>
      __$$SelectDefaultQueryImplCopyWithImpl<_$SelectDefaultQueryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectDefaultQueryImplToJson(
      this,
    );
  }
}

abstract class _SelectDefaultQuery implements SelectDefaultQuery {
  const factory _SelectDefaultQuery(
      final List<int> selected, final int newestId) = _$SelectDefaultQueryImpl;

  factory _SelectDefaultQuery.fromJson(Map<String, dynamic> json) =
      _$SelectDefaultQueryImpl.fromJson;

  @override
  List<int> get selected;
  @override
  int get newestId;

  /// Create a copy of SelectDefaultQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectDefaultQueryImplCopyWith<_$SelectDefaultQueryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
