// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$likeHash() => r'ba8528f200f29647e88232070ef9e0c72635e974';

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

abstract class _$Like extends BuildlessAutoDisposeNotifier<bool> {
  late final int galleryId;

  bool build(
    int galleryId,
  );
}

/// See also [Like].
@ProviderFor(Like)
const likeProvider = LikeFamily();

/// See also [Like].
class LikeFamily extends Family<bool> {
  /// See also [Like].
  const LikeFamily();

  /// See also [Like].
  LikeProvider call(
    int galleryId,
  ) {
    return LikeProvider(
      galleryId,
    );
  }

  @override
  LikeProvider getProviderOverride(
    covariant LikeProvider provider,
  ) {
    return call(
      provider.galleryId,
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
  String? get name => r'likeProvider';
}

/// See also [Like].
class LikeProvider extends AutoDisposeNotifierProviderImpl<Like, bool> {
  /// See also [Like].
  LikeProvider(
    int galleryId,
  ) : this._internal(
          () => Like()..galleryId = galleryId,
          from: likeProvider,
          name: r'likeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$likeHash,
          dependencies: LikeFamily._dependencies,
          allTransitiveDependencies: LikeFamily._allTransitiveDependencies,
          galleryId: galleryId,
        );

  LikeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.galleryId,
  }) : super.internal();

  final int galleryId;

  @override
  bool runNotifierBuild(
    covariant Like notifier,
  ) {
    return notifier.build(
      galleryId,
    );
  }

  @override
  Override overrideWith(Like Function() create) {
    return ProviderOverride(
      origin: this,
      override: LikeProvider._internal(
        () => create()..galleryId = galleryId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        galleryId: galleryId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<Like, bool> createElement() {
    return _LikeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LikeProvider && other.galleryId == galleryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, galleryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LikeRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `galleryId` of this provider.
  int get galleryId;
}

class _LikeProviderElement
    extends AutoDisposeNotifierProviderElement<Like, bool> with LikeRef {
  _LikeProviderElement(super.provider);

  @override
  int get galleryId => (origin as LikeProvider).galleryId;
}

String _$likeListHash() => r'8a36437bfccc67ef43583b8dec0d9e297ca73194';

/// See also [LikeList].
@ProviderFor(LikeList)
final likeListProvider =
    AutoDisposeAsyncNotifierProvider<LikeList, Uint32List>.internal(
  LikeList.new,
  name: r'likeListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$likeListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LikeList = AutoDisposeAsyncNotifier<Uint32List>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
