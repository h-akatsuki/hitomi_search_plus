// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$galleryImagesHash() => r'445cc6493b7fd77d01b387a249209de2811eb3d4';

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

abstract class _$GalleryImages
    extends BuildlessAutoDisposeAsyncNotifier<Set<int>> {
  late final int id;

  FutureOr<Set<int>> build(
    int id,
  );
}

/// See also [GalleryImages].
@ProviderFor(GalleryImages)
const galleryImagesProvider = GalleryImagesFamily();

/// See also [GalleryImages].
class GalleryImagesFamily extends Family<AsyncValue<Set<int>>> {
  /// See also [GalleryImages].
  const GalleryImagesFamily();

  /// See also [GalleryImages].
  GalleryImagesProvider call(
    int id,
  ) {
    return GalleryImagesProvider(
      id,
    );
  }

  @override
  GalleryImagesProvider getProviderOverride(
    covariant GalleryImagesProvider provider,
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
  String? get name => r'galleryImagesProvider';
}

/// See also [GalleryImages].
class GalleryImagesProvider
    extends AutoDisposeAsyncNotifierProviderImpl<GalleryImages, Set<int>> {
  /// See also [GalleryImages].
  GalleryImagesProvider(
    int id,
  ) : this._internal(
          () => GalleryImages()..id = id,
          from: galleryImagesProvider,
          name: r'galleryImagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$galleryImagesHash,
          dependencies: GalleryImagesFamily._dependencies,
          allTransitiveDependencies:
              GalleryImagesFamily._allTransitiveDependencies,
          id: id,
        );

  GalleryImagesProvider._internal(
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
  FutureOr<Set<int>> runNotifierBuild(
    covariant GalleryImages notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(GalleryImages Function() create) {
    return ProviderOverride(
      origin: this,
      override: GalleryImagesProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<GalleryImages, Set<int>>
      createElement() {
    return _GalleryImagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GalleryImagesProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GalleryImagesRef on AutoDisposeAsyncNotifierProviderRef<Set<int>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GalleryImagesProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GalleryImages, Set<int>>
    with GalleryImagesRef {
  _GalleryImagesProviderElement(super.provider);

  @override
  int get id => (origin as GalleryImagesProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
