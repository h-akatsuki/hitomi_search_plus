// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$imageDownloadStatusHash() =>
    r'6bd96771739d77192b411dfdd7efaa584f717ca8';

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

/// See also [imageDownloadStatus].
@ProviderFor(imageDownloadStatus)
const imageDownloadStatusProvider = ImageDownloadStatusFamily();

/// See also [imageDownloadStatus].
class ImageDownloadStatusFamily extends Family<ImageDownloadStatus> {
  /// See also [imageDownloadStatus].
  const ImageDownloadStatusFamily();

  /// See also [imageDownloadStatus].
  ImageDownloadStatusProvider call(
    ImageKey key,
  ) {
    return ImageDownloadStatusProvider(
      key,
    );
  }

  @override
  ImageDownloadStatusProvider getProviderOverride(
    covariant ImageDownloadStatusProvider provider,
  ) {
    return call(
      provider.key,
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
  String? get name => r'imageDownloadStatusProvider';
}

/// See also [imageDownloadStatus].
class ImageDownloadStatusProvider
    extends AutoDisposeProvider<ImageDownloadStatus> {
  /// See also [imageDownloadStatus].
  ImageDownloadStatusProvider(
    ImageKey key,
  ) : this._internal(
          (ref) => imageDownloadStatus(
            ref as ImageDownloadStatusRef,
            key,
          ),
          from: imageDownloadStatusProvider,
          name: r'imageDownloadStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$imageDownloadStatusHash,
          dependencies: ImageDownloadStatusFamily._dependencies,
          allTransitiveDependencies:
              ImageDownloadStatusFamily._allTransitiveDependencies,
          key: key,
        );

  ImageDownloadStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.key,
  }) : super.internal();

  final ImageKey key;

  @override
  Override overrideWith(
    ImageDownloadStatus Function(ImageDownloadStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ImageDownloadStatusProvider._internal(
        (ref) => create(ref as ImageDownloadStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        key: key,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ImageDownloadStatus> createElement() {
    return _ImageDownloadStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ImageDownloadStatusProvider && other.key == key;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, key.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ImageDownloadStatusRef on AutoDisposeProviderRef<ImageDownloadStatus> {
  /// The parameter `key` of this provider.
  ImageKey get key;
}

class _ImageDownloadStatusProviderElement
    extends AutoDisposeProviderElement<ImageDownloadStatus>
    with ImageDownloadStatusRef {
  _ImageDownloadStatusProviderElement(super.provider);

  @override
  ImageKey get key => (origin as ImageDownloadStatusProvider).key;
}

String _$galleryDownloadStatusHash() =>
    r'5d32bcb2f7ea6880c93ef4b86ee041f7bf023a68';

abstract class _$GalleryDownloadStatus
    extends BuildlessAutoDisposeAsyncNotifier<UpdateCounter> {
  late final int id;

  FutureOr<UpdateCounter> build(
    int id,
  );
}

/// See also [GalleryDownloadStatus].
@ProviderFor(GalleryDownloadStatus)
const galleryDownloadStatusProvider = GalleryDownloadStatusFamily();

/// See also [GalleryDownloadStatus].
class GalleryDownloadStatusFamily extends Family<AsyncValue<UpdateCounter>> {
  /// See also [GalleryDownloadStatus].
  const GalleryDownloadStatusFamily();

  /// See also [GalleryDownloadStatus].
  GalleryDownloadStatusProvider call(
    int id,
  ) {
    return GalleryDownloadStatusProvider(
      id,
    );
  }

  @override
  GalleryDownloadStatusProvider getProviderOverride(
    covariant GalleryDownloadStatusProvider provider,
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
  String? get name => r'galleryDownloadStatusProvider';
}

/// See also [GalleryDownloadStatus].
class GalleryDownloadStatusProvider
    extends AutoDisposeAsyncNotifierProviderImpl<GalleryDownloadStatus,
        UpdateCounter> {
  /// See also [GalleryDownloadStatus].
  GalleryDownloadStatusProvider(
    int id,
  ) : this._internal(
          () => GalleryDownloadStatus()..id = id,
          from: galleryDownloadStatusProvider,
          name: r'galleryDownloadStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$galleryDownloadStatusHash,
          dependencies: GalleryDownloadStatusFamily._dependencies,
          allTransitiveDependencies:
              GalleryDownloadStatusFamily._allTransitiveDependencies,
          id: id,
        );

  GalleryDownloadStatusProvider._internal(
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
  FutureOr<UpdateCounter> runNotifierBuild(
    covariant GalleryDownloadStatus notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(GalleryDownloadStatus Function() create) {
    return ProviderOverride(
      origin: this,
      override: GalleryDownloadStatusProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<GalleryDownloadStatus, UpdateCounter>
      createElement() {
    return _GalleryDownloadStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GalleryDownloadStatusProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GalleryDownloadStatusRef
    on AutoDisposeAsyncNotifierProviderRef<UpdateCounter> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GalleryDownloadStatusProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GalleryDownloadStatus,
        UpdateCounter> with GalleryDownloadStatusRef {
  _GalleryDownloadStatusProviderElement(super.provider);

  @override
  int get id => (origin as GalleryDownloadStatusProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
