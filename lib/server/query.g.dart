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
