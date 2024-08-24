// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$backgroundDownloaderHash() =>
    r'2796005fada69061fcc32f746f952ef4c45eff80';

/// See also [BackgroundDownloader].
@ProviderFor(BackgroundDownloader)
final backgroundDownloaderProvider =
    NotifierProvider<BackgroundDownloader, List<int>>.internal(
  BackgroundDownloader.new,
  name: r'backgroundDownloaderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$backgroundDownloaderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BackgroundDownloader = Notifier<List<int>>;
String _$backgroundSingleDownloaderHash() =>
    r'072e535d0d1f768fb66ff1a844844da835d55c3e';

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

abstract class _$BackgroundSingleDownloader
    extends BuildlessAutoDisposeNotifier<bool> {
  late final int id;

  bool build(
    int id,
  );
}

/// See also [BackgroundSingleDownloader].
@ProviderFor(BackgroundSingleDownloader)
const backgroundSingleDownloaderProvider = BackgroundSingleDownloaderFamily();

/// See also [BackgroundSingleDownloader].
class BackgroundSingleDownloaderFamily extends Family<bool> {
  /// See also [BackgroundSingleDownloader].
  const BackgroundSingleDownloaderFamily();

  /// See also [BackgroundSingleDownloader].
  BackgroundSingleDownloaderProvider call(
    int id,
  ) {
    return BackgroundSingleDownloaderProvider(
      id,
    );
  }

  @override
  BackgroundSingleDownloaderProvider getProviderOverride(
    covariant BackgroundSingleDownloaderProvider provider,
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
  String? get name => r'backgroundSingleDownloaderProvider';
}

/// See also [BackgroundSingleDownloader].
class BackgroundSingleDownloaderProvider
    extends AutoDisposeNotifierProviderImpl<BackgroundSingleDownloader, bool> {
  /// See also [BackgroundSingleDownloader].
  BackgroundSingleDownloaderProvider(
    int id,
  ) : this._internal(
          () => BackgroundSingleDownloader()..id = id,
          from: backgroundSingleDownloaderProvider,
          name: r'backgroundSingleDownloaderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$backgroundSingleDownloaderHash,
          dependencies: BackgroundSingleDownloaderFamily._dependencies,
          allTransitiveDependencies:
              BackgroundSingleDownloaderFamily._allTransitiveDependencies,
          id: id,
        );

  BackgroundSingleDownloaderProvider._internal(
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
  bool runNotifierBuild(
    covariant BackgroundSingleDownloader notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(BackgroundSingleDownloader Function() create) {
    return ProviderOverride(
      origin: this,
      override: BackgroundSingleDownloaderProvider._internal(
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
  AutoDisposeNotifierProviderElement<BackgroundSingleDownloader, bool>
      createElement() {
    return _BackgroundSingleDownloaderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BackgroundSingleDownloaderProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BackgroundSingleDownloaderRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `id` of this provider.
  int get id;
}

class _BackgroundSingleDownloaderProviderElement
    extends AutoDisposeNotifierProviderElement<BackgroundSingleDownloader, bool>
    with BackgroundSingleDownloaderRef {
  _BackgroundSingleDownloaderProviderElement(super.provider);

  @override
  int get id => (origin as BackgroundSingleDownloaderProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
