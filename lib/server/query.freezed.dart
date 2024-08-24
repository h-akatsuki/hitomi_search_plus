// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchBuilder _$SearchBuilderFromJson(Map<String, dynamic> json) {
  return _SearchBuilder.fromJson(json);
}

/// @nodoc
mixin _$SearchBuilder {
  String get query => throw _privateConstructorUsedError;
  SelectDefaultQuery get defaultQuery => throw _privateConstructorUsedError;

  /// Serializes this SearchBuilder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchBuilder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchBuilderCopyWith<SearchBuilder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchBuilderCopyWith<$Res> {
  factory $SearchBuilderCopyWith(
          SearchBuilder value, $Res Function(SearchBuilder) then) =
      _$SearchBuilderCopyWithImpl<$Res, SearchBuilder>;
  @useResult
  $Res call({String query, SelectDefaultQuery defaultQuery});

  $SelectDefaultQueryCopyWith<$Res> get defaultQuery;
}

/// @nodoc
class _$SearchBuilderCopyWithImpl<$Res, $Val extends SearchBuilder>
    implements $SearchBuilderCopyWith<$Res> {
  _$SearchBuilderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchBuilder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? defaultQuery = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      defaultQuery: null == defaultQuery
          ? _value.defaultQuery
          : defaultQuery // ignore: cast_nullable_to_non_nullable
              as SelectDefaultQuery,
    ) as $Val);
  }

  /// Create a copy of SearchBuilder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectDefaultQueryCopyWith<$Res> get defaultQuery {
    return $SelectDefaultQueryCopyWith<$Res>(_value.defaultQuery, (value) {
      return _then(_value.copyWith(defaultQuery: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchBuilderImplCopyWith<$Res>
    implements $SearchBuilderCopyWith<$Res> {
  factory _$$SearchBuilderImplCopyWith(
          _$SearchBuilderImpl value, $Res Function(_$SearchBuilderImpl) then) =
      __$$SearchBuilderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String query, SelectDefaultQuery defaultQuery});

  @override
  $SelectDefaultQueryCopyWith<$Res> get defaultQuery;
}

/// @nodoc
class __$$SearchBuilderImplCopyWithImpl<$Res>
    extends _$SearchBuilderCopyWithImpl<$Res, _$SearchBuilderImpl>
    implements _$$SearchBuilderImplCopyWith<$Res> {
  __$$SearchBuilderImplCopyWithImpl(
      _$SearchBuilderImpl _value, $Res Function(_$SearchBuilderImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchBuilder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? defaultQuery = null,
  }) {
    return _then(_$SearchBuilderImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      defaultQuery: null == defaultQuery
          ? _value.defaultQuery
          : defaultQuery // ignore: cast_nullable_to_non_nullable
              as SelectDefaultQuery,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchBuilderImpl implements _SearchBuilder {
  _$SearchBuilderImpl({required this.query, required this.defaultQuery});

  factory _$SearchBuilderImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchBuilderImplFromJson(json);

  @override
  final String query;
  @override
  final SelectDefaultQuery defaultQuery;

  @override
  String toString() {
    return 'SearchBuilder(query: $query, defaultQuery: $defaultQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchBuilderImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.defaultQuery, defaultQuery) ||
                other.defaultQuery == defaultQuery));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, query, defaultQuery);

  /// Create a copy of SearchBuilder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchBuilderImplCopyWith<_$SearchBuilderImpl> get copyWith =>
      __$$SearchBuilderImplCopyWithImpl<_$SearchBuilderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchBuilderImplToJson(
      this,
    );
  }
}

abstract class _SearchBuilder implements SearchBuilder {
  factory _SearchBuilder(
      {required final String query,
      required final SelectDefaultQuery defaultQuery}) = _$SearchBuilderImpl;

  factory _SearchBuilder.fromJson(Map<String, dynamic> json) =
      _$SearchBuilderImpl.fromJson;

  @override
  String get query;
  @override
  SelectDefaultQuery get defaultQuery;

  /// Create a copy of SearchBuilder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchBuilderImplCopyWith<_$SearchBuilderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchParams _$SearchParamsFromJson(Map<String, dynamic> json) {
  return _SearchParams.fromJson(json);
}

/// @nodoc
mixin _$SearchParams {
  List<String> get queries => throw _privateConstructorUsedError;

  /// Serializes this SearchParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchParamsCopyWith<SearchParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchParamsCopyWith<$Res> {
  factory $SearchParamsCopyWith(
          SearchParams value, $Res Function(SearchParams) then) =
      _$SearchParamsCopyWithImpl<$Res, SearchParams>;
  @useResult
  $Res call({List<String> queries});
}

/// @nodoc
class _$SearchParamsCopyWithImpl<$Res, $Val extends SearchParams>
    implements $SearchParamsCopyWith<$Res> {
  _$SearchParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queries = null,
  }) {
    return _then(_value.copyWith(
      queries: null == queries
          ? _value.queries
          : queries // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchParamsImplCopyWith<$Res>
    implements $SearchParamsCopyWith<$Res> {
  factory _$$SearchParamsImplCopyWith(
          _$SearchParamsImpl value, $Res Function(_$SearchParamsImpl) then) =
      __$$SearchParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> queries});
}

/// @nodoc
class __$$SearchParamsImplCopyWithImpl<$Res>
    extends _$SearchParamsCopyWithImpl<$Res, _$SearchParamsImpl>
    implements _$$SearchParamsImplCopyWith<$Res> {
  __$$SearchParamsImplCopyWithImpl(
      _$SearchParamsImpl _value, $Res Function(_$SearchParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queries = null,
  }) {
    return _then(_$SearchParamsImpl(
      queries: null == queries
          ? _value._queries
          : queries // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchParamsImpl implements _SearchParams {
  _$SearchParamsImpl({required final List<String> queries})
      : _queries = queries;

  factory _$SearchParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchParamsImplFromJson(json);

  final List<String> _queries;
  @override
  List<String> get queries {
    if (_queries is EqualUnmodifiableListView) return _queries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queries);
  }

  @override
  String toString() {
    return 'SearchParams(queries: $queries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchParamsImpl &&
            const DeepCollectionEquality().equals(other._queries, _queries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_queries));

  /// Create a copy of SearchParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchParamsImplCopyWith<_$SearchParamsImpl> get copyWith =>
      __$$SearchParamsImplCopyWithImpl<_$SearchParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchParamsImplToJson(
      this,
    );
  }
}

abstract class _SearchParams implements SearchParams {
  factory _SearchParams({required final List<String> queries}) =
      _$SearchParamsImpl;

  factory _SearchParams.fromJson(Map<String, dynamic> json) =
      _$SearchParamsImpl.fromJson;

  @override
  List<String> get queries;

  /// Create a copy of SearchParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchParamsImplCopyWith<_$SearchParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
