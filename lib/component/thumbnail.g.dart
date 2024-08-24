// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thumbnail.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$autoTitleHash() => r'b911c45a8c9dd88f752c7ed3ad9d1c30c8e9b5b3';

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

/// See also [autoTitle].
@ProviderFor(autoTitle)
const autoTitleProvider = AutoTitleFamily();

/// See also [autoTitle].
class AutoTitleFamily extends Family<String> {
  /// See also [autoTitle].
  const AutoTitleFamily();

  /// See also [autoTitle].
  AutoTitleProvider call(
    int id,
  ) {
    return AutoTitleProvider(
      id,
    );
  }

  @override
  AutoTitleProvider getProviderOverride(
    covariant AutoTitleProvider provider,
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
  String? get name => r'autoTitleProvider';
}

/// See also [autoTitle].
class AutoTitleProvider extends AutoDisposeProvider<String> {
  /// See also [autoTitle].
  AutoTitleProvider(
    int id,
  ) : this._internal(
          (ref) => autoTitle(
            ref as AutoTitleRef,
            id,
          ),
          from: autoTitleProvider,
          name: r'autoTitleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$autoTitleHash,
          dependencies: AutoTitleFamily._dependencies,
          allTransitiveDependencies: AutoTitleFamily._allTransitiveDependencies,
          id: id,
        );

  AutoTitleProvider._internal(
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
    String Function(AutoTitleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AutoTitleProvider._internal(
        (ref) => create(ref as AutoTitleRef),
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
  AutoDisposeProviderElement<String> createElement() {
    return _AutoTitleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AutoTitleProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AutoTitleRef on AutoDisposeProviderRef<String> {
  /// The parameter `id` of this provider.
  int get id;
}

class _AutoTitleProviderElement extends AutoDisposeProviderElement<String>
    with AutoTitleRef {
  _AutoTitleProviderElement(super.provider);

  @override
  int get id => (origin as AutoTitleProvider).id;
}

String _$useJapaneseHash() => r'2123c35c8c2a0b822e65ab67f9248df6daf1a38b';

/// See also [UseJapanese].
@ProviderFor(UseJapanese)
final useJapaneseProvider = NotifierProvider<UseJapanese, bool>.internal(
  UseJapanese.new,
  name: r'useJapaneseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$useJapaneseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UseJapanese = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
