// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$viewDownloaderHash() => r'c1f744eed5840b73e948fb2fd31ee5a369c1aba0';

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

abstract class _$ViewDownloader
    extends BuildlessAutoDisposeAsyncNotifier<bool> {
  late final int id;

  FutureOr<bool> build(
    int id,
  );
}

/// See also [ViewDownloader].
@ProviderFor(ViewDownloader)
const viewDownloaderProvider = ViewDownloaderFamily();

/// See also [ViewDownloader].
class ViewDownloaderFamily extends Family<AsyncValue<bool>> {
  /// See also [ViewDownloader].
  const ViewDownloaderFamily();

  /// See also [ViewDownloader].
  ViewDownloaderProvider call(
    int id,
  ) {
    return ViewDownloaderProvider(
      id,
    );
  }

  @override
  ViewDownloaderProvider getProviderOverride(
    covariant ViewDownloaderProvider provider,
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
  String? get name => r'viewDownloaderProvider';
}

/// See also [ViewDownloader].
class ViewDownloaderProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ViewDownloader, bool> {
  /// See also [ViewDownloader].
  ViewDownloaderProvider(
    int id,
  ) : this._internal(
          () => ViewDownloader()..id = id,
          from: viewDownloaderProvider,
          name: r'viewDownloaderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$viewDownloaderHash,
          dependencies: ViewDownloaderFamily._dependencies,
          allTransitiveDependencies:
              ViewDownloaderFamily._allTransitiveDependencies,
          id: id,
        );

  ViewDownloaderProvider._internal(
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
  FutureOr<bool> runNotifierBuild(
    covariant ViewDownloader notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(ViewDownloader Function() create) {
    return ProviderOverride(
      origin: this,
      override: ViewDownloaderProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ViewDownloader, bool>
      createElement() {
    return _ViewDownloaderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ViewDownloaderProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ViewDownloaderRef on AutoDisposeAsyncNotifierProviderRef<bool> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ViewDownloaderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ViewDownloader, bool>
    with ViewDownloaderRef {
  _ViewDownloaderProviderElement(super.provider);

  @override
  int get id => (origin as ViewDownloaderProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
