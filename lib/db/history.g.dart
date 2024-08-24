// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getHistoryHash() => r'e4277ac2aa0e4e416d40c3a5888a08a2d62ea368';

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

/// See also [getHistory].
@ProviderFor(getHistory)
const getHistoryProvider = GetHistoryFamily();

/// See also [getHistory].
class GetHistoryFamily extends Family<AsyncValue<HistoryItem?>> {
  /// See also [getHistory].
  const GetHistoryFamily();

  /// See also [getHistory].
  GetHistoryProvider call(
    int index,
  ) {
    return GetHistoryProvider(
      index,
    );
  }

  @override
  GetHistoryProvider getProviderOverride(
    covariant GetHistoryProvider provider,
  ) {
    return call(
      provider.index,
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
  String? get name => r'getHistoryProvider';
}

/// See also [getHistory].
class GetHistoryProvider extends AutoDisposeFutureProvider<HistoryItem?> {
  /// See also [getHistory].
  GetHistoryProvider(
    int index,
  ) : this._internal(
          (ref) => getHistory(
            ref as GetHistoryRef,
            index,
          ),
          from: getHistoryProvider,
          name: r'getHistoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getHistoryHash,
          dependencies: GetHistoryFamily._dependencies,
          allTransitiveDependencies:
              GetHistoryFamily._allTransitiveDependencies,
          index: index,
        );

  GetHistoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  Override overrideWith(
    FutureOr<HistoryItem?> Function(GetHistoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetHistoryProvider._internal(
        (ref) => create(ref as GetHistoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<HistoryItem?> createElement() {
    return _GetHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetHistoryProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetHistoryRef on AutoDisposeFutureProviderRef<HistoryItem?> {
  /// The parameter `index` of this provider.
  int get index;
}

class _GetHistoryProviderElement
    extends AutoDisposeFutureProviderElement<HistoryItem?> with GetHistoryRef {
  _GetHistoryProviderElement(super.provider);

  @override
  int get index => (origin as GetHistoryProvider).index;
}

String _$historyHash() => r'4caadc6579ea53e498cef40c0c7cb72943afb0fd';

/// See also [History].
@ProviderFor(History)
final historyProvider = NotifierProvider<History, HistoryState>.internal(
  History.new,
  name: r'historyProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$historyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$History = Notifier<HistoryState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
