// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'small_image.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$smallImageHash() => r'89be84638103f2f027858832f55f855336947c90';

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

/// See also [smallImage].
@ProviderFor(smallImage)
const smallImageProvider = SmallImageFamily();

/// See also [smallImage].
class SmallImageFamily extends Family<AsyncValue<SmallImageItem>> {
  /// See also [smallImage].
  const SmallImageFamily();

  /// See also [smallImage].
  SmallImageProvider call(
    int id,
  ) {
    return SmallImageProvider(
      id,
    );
  }

  @override
  SmallImageProvider getProviderOverride(
    covariant SmallImageProvider provider,
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
  String? get name => r'smallImageProvider';
}

/// See also [smallImage].
class SmallImageProvider extends AutoDisposeFutureProvider<SmallImageItem> {
  /// See also [smallImage].
  SmallImageProvider(
    int id,
  ) : this._internal(
          (ref) => smallImage(
            ref as SmallImageRef,
            id,
          ),
          from: smallImageProvider,
          name: r'smallImageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$smallImageHash,
          dependencies: SmallImageFamily._dependencies,
          allTransitiveDependencies:
              SmallImageFamily._allTransitiveDependencies,
          id: id,
        );

  SmallImageProvider._internal(
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
    FutureOr<SmallImageItem> Function(SmallImageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SmallImageProvider._internal(
        (ref) => create(ref as SmallImageRef),
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
  AutoDisposeFutureProviderElement<SmallImageItem> createElement() {
    return _SmallImageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SmallImageProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SmallImageRef on AutoDisposeFutureProviderRef<SmallImageItem> {
  /// The parameter `id` of this provider.
  int get id;
}

class _SmallImageProviderElement
    extends AutoDisposeFutureProviderElement<SmallImageItem>
    with SmallImageRef {
  _SmallImageProviderElement(super.provider);

  @override
  int get id => (origin as SmallImageProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
