// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DefaultQueryListImpl _$$DefaultQueryListImplFromJson(
        Map<String, dynamic> json) =>
    _$DefaultQueryListImpl(
      nextId: (json['nextId'] as num).toInt(),
      queries: (json['queries'] as List<dynamic>)
          .map((e) => DefaultQuery.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DefaultQueryListImplToJson(
        _$DefaultQueryListImpl instance) =>
    <String, dynamic>{
      'nextId': instance.nextId,
      'queries': instance.queries,
    };

_$DefaultQueryImpl _$$DefaultQueryImplFromJson(Map<String, dynamic> json) =>
    _$DefaultQueryImpl(
      id: (json['id'] as num).toInt(),
      query: json['query'] as String,
      title: json['title'] as String,
      defaultValue: json['defaultValue'] as bool,
    );

Map<String, dynamic> _$$DefaultQueryImplToJson(_$DefaultQueryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'query': instance.query,
      'title': instance.title,
      'defaultValue': instance.defaultValue,
    };

_$SelectDefaultQueryImpl _$$SelectDefaultQueryImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectDefaultQueryImpl(
      (json['selected'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      (json['newestId'] as num).toInt(),
    );

Map<String, dynamic> _$$SelectDefaultQueryImplToJson(
        _$SelectDefaultQueryImpl instance) =>
    <String, dynamic>{
      'selected': instance.selected,
      'newestId': instance.newestId,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$defaultQueryDataHash() => r'528acf44d23663a85ec09b9890e37211c1ce4987';

/// See also [DefaultQueryData].
@ProviderFor(DefaultQueryData)
final defaultQueryDataProvider =
    NotifierProvider<DefaultQueryData, DefaultQueryList>.internal(
  DefaultQueryData.new,
  name: r'defaultQueryDataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$defaultQueryDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DefaultQueryData = Notifier<DefaultQueryList>;
String _$defaultQuerySingleHash() =>
    r'616b7f93ebd8dad66801cf9a1aace2d36b4bab63';

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

abstract class _$DefaultQuerySingle
    extends BuildlessAutoDisposeNotifier<DefaultQuery?> {
  late final int id;

  DefaultQuery? build(
    int id,
  );
}

/// See also [DefaultQuerySingle].
@ProviderFor(DefaultQuerySingle)
const defaultQuerySingleProvider = DefaultQuerySingleFamily();

/// See also [DefaultQuerySingle].
class DefaultQuerySingleFamily extends Family<DefaultQuery?> {
  /// See also [DefaultQuerySingle].
  const DefaultQuerySingleFamily();

  /// See also [DefaultQuerySingle].
  DefaultQuerySingleProvider call(
    int id,
  ) {
    return DefaultQuerySingleProvider(
      id,
    );
  }

  @override
  DefaultQuerySingleProvider getProviderOverride(
    covariant DefaultQuerySingleProvider provider,
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
  String? get name => r'defaultQuerySingleProvider';
}

/// See also [DefaultQuerySingle].
class DefaultQuerySingleProvider
    extends AutoDisposeNotifierProviderImpl<DefaultQuerySingle, DefaultQuery?> {
  /// See also [DefaultQuerySingle].
  DefaultQuerySingleProvider(
    int id,
  ) : this._internal(
          () => DefaultQuerySingle()..id = id,
          from: defaultQuerySingleProvider,
          name: r'defaultQuerySingleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$defaultQuerySingleHash,
          dependencies: DefaultQuerySingleFamily._dependencies,
          allTransitiveDependencies:
              DefaultQuerySingleFamily._allTransitiveDependencies,
          id: id,
        );

  DefaultQuerySingleProvider._internal(
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
  DefaultQuery? runNotifierBuild(
    covariant DefaultQuerySingle notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(DefaultQuerySingle Function() create) {
    return ProviderOverride(
      origin: this,
      override: DefaultQuerySingleProvider._internal(
        () => create()..id = id,
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
  AutoDisposeNotifierProviderElement<DefaultQuerySingle, DefaultQuery?>
      createElement() {
    return _DefaultQuerySingleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DefaultQuerySingleProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DefaultQuerySingleRef on AutoDisposeNotifierProviderRef<DefaultQuery?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DefaultQuerySingleProviderElement
    extends AutoDisposeNotifierProviderElement<DefaultQuerySingle,
        DefaultQuery?> with DefaultQuerySingleRef {
  _DefaultQuerySingleProviderElement(super.provider);

  @override
  int get id => (origin as DefaultQuerySingleProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
