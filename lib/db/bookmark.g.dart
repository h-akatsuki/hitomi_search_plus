// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bookmarkedHash() => r'7083f4843ef156775ba3600f3de3a48077864081';

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

/// See also [bookmarked].
@ProviderFor(bookmarked)
const bookmarkedProvider = BookmarkedFamily();

/// See also [bookmarked].
class BookmarkedFamily extends Family<int?> {
  /// See also [bookmarked].
  const BookmarkedFamily();

  /// See also [bookmarked].
  BookmarkedProvider call(
    String query,
  ) {
    return BookmarkedProvider(
      query,
    );
  }

  @override
  BookmarkedProvider getProviderOverride(
    covariant BookmarkedProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'bookmarkedProvider';
}

/// See also [bookmarked].
class BookmarkedProvider extends AutoDisposeProvider<int?> {
  /// See also [bookmarked].
  BookmarkedProvider(
    String query,
  ) : this._internal(
          (ref) => bookmarked(
            ref as BookmarkedRef,
            query,
          ),
          from: bookmarkedProvider,
          name: r'bookmarkedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bookmarkedHash,
          dependencies: BookmarkedFamily._dependencies,
          allTransitiveDependencies:
              BookmarkedFamily._allTransitiveDependencies,
          query: query,
        );

  BookmarkedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    int? Function(BookmarkedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BookmarkedProvider._internal(
        (ref) => create(ref as BookmarkedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<int?> createElement() {
    return _BookmarkedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BookmarkedProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BookmarkedRef on AutoDisposeProviderRef<int?> {
  /// The parameter `query` of this provider.
  String get query;
}

class _BookmarkedProviderElement extends AutoDisposeProviderElement<int?>
    with BookmarkedRef {
  _BookmarkedProviderElement(super.provider);

  @override
  String get query => (origin as BookmarkedProvider).query;
}

String _$bookmarkGetHash() => r'a8d553fd51d29fda7caf5277105d483350fe07aa';

/// See also [bookmarkGet].
@ProviderFor(bookmarkGet)
const bookmarkGetProvider = BookmarkGetFamily();

/// See also [bookmarkGet].
class BookmarkGetFamily extends Family<BookmarkItem?> {
  /// See also [bookmarkGet].
  const BookmarkGetFamily();

  /// See also [bookmarkGet].
  BookmarkGetProvider call(
    int id,
  ) {
    return BookmarkGetProvider(
      id,
    );
  }

  @override
  BookmarkGetProvider getProviderOverride(
    covariant BookmarkGetProvider provider,
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
  String? get name => r'bookmarkGetProvider';
}

/// See also [bookmarkGet].
class BookmarkGetProvider extends AutoDisposeProvider<BookmarkItem?> {
  /// See also [bookmarkGet].
  BookmarkGetProvider(
    int id,
  ) : this._internal(
          (ref) => bookmarkGet(
            ref as BookmarkGetRef,
            id,
          ),
          from: bookmarkGetProvider,
          name: r'bookmarkGetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bookmarkGetHash,
          dependencies: BookmarkGetFamily._dependencies,
          allTransitiveDependencies:
              BookmarkGetFamily._allTransitiveDependencies,
          id: id,
        );

  BookmarkGetProvider._internal(
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
    BookmarkItem? Function(BookmarkGetRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BookmarkGetProvider._internal(
        (ref) => create(ref as BookmarkGetRef),
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
  AutoDisposeProviderElement<BookmarkItem?> createElement() {
    return _BookmarkGetProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BookmarkGetProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BookmarkGetRef on AutoDisposeProviderRef<BookmarkItem?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _BookmarkGetProviderElement
    extends AutoDisposeProviderElement<BookmarkItem?> with BookmarkGetRef {
  _BookmarkGetProviderElement(super.provider);

  @override
  int get id => (origin as BookmarkGetProvider).id;
}

String _$updateingBookmarkHash() => r'77913f2c731a6d78da96a33dfa777b2dd54a4443';

/// See also [UpdateingBookmark].
@ProviderFor(UpdateingBookmark)
final updateingBookmarkProvider =
    NotifierProvider<UpdateingBookmark, UpdaterState>.internal(
  UpdateingBookmark.new,
  name: r'updateingBookmarkProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updateingBookmarkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UpdateingBookmark = Notifier<UpdaterState>;
String _$bookmarkLastUpdateHash() =>
    r'f9de4a9830e25c1ac64bd95d12f5e4ce6d805e79';

/// See also [BookmarkLastUpdate].
@ProviderFor(BookmarkLastUpdate)
final bookmarkLastUpdateProvider =
    NotifierProvider<BookmarkLastUpdate, String>.internal(
  BookmarkLastUpdate.new,
  name: r'bookmarkLastUpdateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bookmarkLastUpdateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BookmarkLastUpdate = Notifier<String>;
String _$bookmarkHash() => r'd58ababcf70a9ce62370c43878d7fe535b4dbe57';

/// See also [Bookmark].
@ProviderFor(Bookmark)
final bookmarkProvider =
    NotifierProvider<Bookmark, List<BookmarkItem>>.internal(
  Bookmark.new,
  name: r'bookmarkProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$bookmarkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Bookmark = Notifier<List<BookmarkItem>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
