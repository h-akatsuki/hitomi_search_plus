// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'export.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookmarkExportItemImpl _$$BookmarkExportItemImplFromJson(
        Map<String, dynamic> json) =>
    _$BookmarkExportItemImpl(
      id: (json['id'] as num).toInt(),
      query: json['query'] as String,
      defaultQuery: json['defaultQuery'] as String,
      title: json['title'] as String?,
      addedAt: (json['addedAt'] as num).toInt(),
    );

Map<String, dynamic> _$$BookmarkExportItemImplToJson(
        _$BookmarkExportItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'query': instance.query,
      'defaultQuery': instance.defaultQuery,
      'title': instance.title,
      'addedAt': instance.addedAt,
    };

_$BookmarkExportImpl _$$BookmarkExportImplFromJson(Map<String, dynamic> json) =>
    _$BookmarkExportImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => BookmarkExportItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BookmarkExportImplToJson(
        _$BookmarkExportImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

_$LikeExportItemImpl _$$LikeExportItemImplFromJson(Map<String, dynamic> json) =>
    _$LikeExportItemImpl(
      id: (json['id'] as num).toInt(),
      addedAt: (json['addedAt'] as num).toInt(),
    );

Map<String, dynamic> _$$LikeExportItemImplToJson(
        _$LikeExportItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'addedAt': instance.addedAt,
    };

_$ExportDataImpl _$$ExportDataImplFromJson(Map<String, dynamic> json) =>
    _$ExportDataImpl(
      bookmarks:
          BookmarkExport.fromJson(json['bookmarks'] as Map<String, dynamic>),
      defaultQueryList: DefaultQueryList.fromJson(
          json['defaultQueryList'] as Map<String, dynamic>),
      likes: (json['likes'] as List<dynamic>)
          .map((e) => LikeExportItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ExportDataImplToJson(_$ExportDataImpl instance) =>
    <String, dynamic>{
      'bookmarks': instance.bookmarks,
      'defaultQueryList': instance.defaultQueryList,
      'likes': instance.likes,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dataSyncStateHash() => r'b5c91d7716942c91f4392111c203b4874322324e';

/// See also [DataSyncState].
@ProviderFor(DataSyncState)
final dataSyncStateProvider =
    AutoDisposeNotifierProvider<DataSyncState, DataSyncs>.internal(
  DataSyncState.new,
  name: r'dataSyncStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dataSyncStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DataSyncState = AutoDisposeNotifier<DataSyncs>;
String _$dataSyncHash() => r'441166e68ecbcdc11290befd84bfbc912bc4f91a';

/// See also [DataSync].
@ProviderFor(DataSync)
final dataSyncProvider = NotifierProvider<DataSync, int>.internal(
  DataSync.new,
  name: r'dataSyncProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dataSyncHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DataSync = Notifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
