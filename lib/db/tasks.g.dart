// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tasksHash() => r'a9056570a8d7a2173ebcb2943ad4db6608be4062';

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

abstract class _$Tasks extends BuildlessAutoDisposeAsyncNotifier<Task?> {
  late final int id;

  FutureOr<Task?> build(
    int id,
  );
}

/// See also [Tasks].
@ProviderFor(Tasks)
const tasksProvider = TasksFamily();

/// See also [Tasks].
class TasksFamily extends Family<AsyncValue<Task?>> {
  /// See also [Tasks].
  const TasksFamily();

  /// See also [Tasks].
  TasksProvider call(
    int id,
  ) {
    return TasksProvider(
      id,
    );
  }

  @override
  TasksProvider getProviderOverride(
    covariant TasksProvider provider,
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
  String? get name => r'tasksProvider';
}

/// See also [Tasks].
class TasksProvider extends AutoDisposeAsyncNotifierProviderImpl<Tasks, Task?> {
  /// See also [Tasks].
  TasksProvider(
    int id,
  ) : this._internal(
          () => Tasks()..id = id,
          from: tasksProvider,
          name: r'tasksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tasksHash,
          dependencies: TasksFamily._dependencies,
          allTransitiveDependencies: TasksFamily._allTransitiveDependencies,
          id: id,
        );

  TasksProvider._internal(
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
  FutureOr<Task?> runNotifierBuild(
    covariant Tasks notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(Tasks Function() create) {
    return ProviderOverride(
      origin: this,
      override: TasksProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<Tasks, Task?> createElement() {
    return _TasksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TasksProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TasksRef on AutoDisposeAsyncNotifierProviderRef<Task?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _TasksProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Tasks, Task?>
    with TasksRef {
  _TasksProviderElement(super.provider);

  @override
  int get id => (origin as TasksProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
