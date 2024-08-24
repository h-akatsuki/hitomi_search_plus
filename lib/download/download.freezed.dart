// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImageKey {
  int get id => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  /// Create a copy of ImageKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageKeyCopyWith<ImageKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageKeyCopyWith<$Res> {
  factory $ImageKeyCopyWith(ImageKey value, $Res Function(ImageKey) then) =
      _$ImageKeyCopyWithImpl<$Res, ImageKey>;
  @useResult
  $Res call({int id, int page});
}

/// @nodoc
class _$ImageKeyCopyWithImpl<$Res, $Val extends ImageKey>
    implements $ImageKeyCopyWith<$Res> {
  _$ImageKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageKeyImplCopyWith<$Res>
    implements $ImageKeyCopyWith<$Res> {
  factory _$$ImageKeyImplCopyWith(
          _$ImageKeyImpl value, $Res Function(_$ImageKeyImpl) then) =
      __$$ImageKeyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int page});
}

/// @nodoc
class __$$ImageKeyImplCopyWithImpl<$Res>
    extends _$ImageKeyCopyWithImpl<$Res, _$ImageKeyImpl>
    implements _$$ImageKeyImplCopyWith<$Res> {
  __$$ImageKeyImplCopyWithImpl(
      _$ImageKeyImpl _value, $Res Function(_$ImageKeyImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImageKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? page = null,
  }) {
    return _then(_$ImageKeyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ImageKeyImpl with DiagnosticableTreeMixin implements _ImageKey {
  _$ImageKeyImpl({required this.id, required this.page});

  @override
  final int id;
  @override
  final int page;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageKey(id: $id, page: $page)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImageKey'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('page', page));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageKeyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, page);

  /// Create a copy of ImageKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageKeyImplCopyWith<_$ImageKeyImpl> get copyWith =>
      __$$ImageKeyImplCopyWithImpl<_$ImageKeyImpl>(this, _$identity);
}

abstract class _ImageKey implements ImageKey {
  factory _ImageKey({required final int id, required final int page}) =
      _$ImageKeyImpl;

  @override
  int get id;
  @override
  int get page;

  /// Create a copy of ImageKey
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageKeyImplCopyWith<_$ImageKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
