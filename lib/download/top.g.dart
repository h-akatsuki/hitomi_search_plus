// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$topImageStatusHash() => r'63f5f2da3f44e9684343d3cd5c3f5e8543e6996d';

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

/// See also [topImageStatus].
@ProviderFor(topImageStatus)
const topImageStatusProvider = TopImageStatusFamily();

/// See also [topImageStatus].
class TopImageStatusFamily extends Family<ImageDownloadStatus> {
  /// See also [topImageStatus].
  const TopImageStatusFamily();

  /// See also [topImageStatus].
  TopImageStatusProvider call(
    int id,
  ) {
    return TopImageStatusProvider(
      id,
    );
  }

  @override
  TopImageStatusProvider getProviderOverride(
    covariant TopImageStatusProvider provider,
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
  String? get name => r'topImageStatusProvider';
}

/// See also [topImageStatus].
class TopImageStatusProvider extends AutoDisposeProvider<ImageDownloadStatus> {
  /// See also [topImageStatus].
  TopImageStatusProvider(
    int id,
  ) : this._internal(
          (ref) => topImageStatus(
            ref as TopImageStatusRef,
            id,
          ),
          from: topImageStatusProvider,
          name: r'topImageStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$topImageStatusHash,
          dependencies: TopImageStatusFamily._dependencies,
          allTransitiveDependencies:
              TopImageStatusFamily._allTransitiveDependencies,
          id: id,
        );

  TopImageStatusProvider._internal(
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
    ImageDownloadStatus Function(TopImageStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TopImageStatusProvider._internal(
        (ref) => create(ref as TopImageStatusRef),
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
  AutoDisposeProviderElement<ImageDownloadStatus> createElement() {
    return _TopImageStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TopImageStatusProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TopImageStatusRef on AutoDisposeProviderRef<ImageDownloadStatus> {
  /// The parameter `id` of this provider.
  int get id;
}

class _TopImageStatusProviderElement
    extends AutoDisposeProviderElement<ImageDownloadStatus>
    with TopImageStatusRef {
  _TopImageStatusProviderElement(super.provider);

  @override
  int get id => (origin as TopImageStatusProvider).id;
}

String _$topBigImageStatusHash() => r'7e8258fb05ad1008614e9a1c70bcb3574cc7f1d4';

abstract class _$TopBigImageStatus
    extends BuildlessAutoDisposeNotifier<ImageDownloadStatus> {
  late final int id;

  ImageDownloadStatus build(
    int id,
  );
}

/// See also [TopBigImageStatus].
@ProviderFor(TopBigImageStatus)
const topBigImageStatusProvider = TopBigImageStatusFamily();

/// See also [TopBigImageStatus].
class TopBigImageStatusFamily extends Family<ImageDownloadStatus> {
  /// See also [TopBigImageStatus].
  const TopBigImageStatusFamily();

  /// See also [TopBigImageStatus].
  TopBigImageStatusProvider call(
    int id,
  ) {
    return TopBigImageStatusProvider(
      id,
    );
  }

  @override
  TopBigImageStatusProvider getProviderOverride(
    covariant TopBigImageStatusProvider provider,
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
  String? get name => r'topBigImageStatusProvider';
}

/// See also [TopBigImageStatus].
class TopBigImageStatusProvider extends AutoDisposeNotifierProviderImpl<
    TopBigImageStatus, ImageDownloadStatus> {
  /// See also [TopBigImageStatus].
  TopBigImageStatusProvider(
    int id,
  ) : this._internal(
          () => TopBigImageStatus()..id = id,
          from: topBigImageStatusProvider,
          name: r'topBigImageStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$topBigImageStatusHash,
          dependencies: TopBigImageStatusFamily._dependencies,
          allTransitiveDependencies:
              TopBigImageStatusFamily._allTransitiveDependencies,
          id: id,
        );

  TopBigImageStatusProvider._internal(
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
  ImageDownloadStatus runNotifierBuild(
    covariant TopBigImageStatus notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(TopBigImageStatus Function() create) {
    return ProviderOverride(
      origin: this,
      override: TopBigImageStatusProvider._internal(
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
  AutoDisposeNotifierProviderElement<TopBigImageStatus, ImageDownloadStatus>
      createElement() {
    return _TopBigImageStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TopBigImageStatusProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TopBigImageStatusRef
    on AutoDisposeNotifierProviderRef<ImageDownloadStatus> {
  /// The parameter `id` of this provider.
  int get id;
}

class _TopBigImageStatusProviderElement
    extends AutoDisposeNotifierProviderElement<TopBigImageStatus,
        ImageDownloadStatus> with TopBigImageStatusRef {
  _TopBigImageStatusProviderElement(super.provider);

  @override
  int get id => (origin as TopBigImageStatusProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
