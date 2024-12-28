// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchBuilderImpl _$$SearchBuilderImplFromJson(Map<String, dynamic> json) =>
    _$SearchBuilderImpl(
      query: json['query'] as String,
      defaultQuery: SelectDefaultQuery.fromJson(
          json['defaultQuery'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SearchBuilderImplToJson(_$SearchBuilderImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
      'defaultQuery': instance.defaultQuery,
    };

_$SearchParamsImpl _$$SearchParamsImplFromJson(Map<String, dynamic> json) =>
    _$SearchParamsImpl(
      queries:
          (json['queries'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$SearchParamsImplToJson(_$SearchParamsImpl instance) =>
    <String, dynamic>{
      'queries': instance.queries,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$queryAPIUriHash() => r'da3996519170676a36c076b4301d71091459052b';

/// See also [QueryAPIUri].
@ProviderFor(QueryAPIUri)
final queryAPIUriProvider =
    AutoDisposeNotifierProvider<QueryAPIUri, String>.internal(
  QueryAPIUri.new,
  name: r'queryAPIUriProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$queryAPIUriHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$QueryAPIUri = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
