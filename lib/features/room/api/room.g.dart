// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$roomAsyncNotifierHash() => r'e2d05300fb8c3751769f400ad3a63342e8ac099c';

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

abstract class _$RoomAsyncNotifier
    extends BuildlessAutoDisposeAsyncNotifier<Room> {
  late final int id;

  FutureOr<Room> build(
    int id,
  );
}

/// See also [RoomAsyncNotifier].
@ProviderFor(RoomAsyncNotifier)
const roomAsyncNotifierProvider = RoomAsyncNotifierFamily();

/// See also [RoomAsyncNotifier].
class RoomAsyncNotifierFamily extends Family<AsyncValue<Room>> {
  /// See also [RoomAsyncNotifier].
  const RoomAsyncNotifierFamily();

  /// See also [RoomAsyncNotifier].
  RoomAsyncNotifierProvider call(
    int id,
  ) {
    return RoomAsyncNotifierProvider(
      id,
    );
  }

  @override
  RoomAsyncNotifierProvider getProviderOverride(
    covariant RoomAsyncNotifierProvider provider,
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
  String? get name => r'roomAsyncNotifierProvider';
}

/// See also [RoomAsyncNotifier].
class RoomAsyncNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<RoomAsyncNotifier, Room> {
  /// See also [RoomAsyncNotifier].
  RoomAsyncNotifierProvider(
    int id,
  ) : this._internal(
          () => RoomAsyncNotifier()..id = id,
          from: roomAsyncNotifierProvider,
          name: r'roomAsyncNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomAsyncNotifierHash,
          dependencies: RoomAsyncNotifierFamily._dependencies,
          allTransitiveDependencies:
              RoomAsyncNotifierFamily._allTransitiveDependencies,
          id: id,
        );

  RoomAsyncNotifierProvider._internal(
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
  FutureOr<Room> runNotifierBuild(
    covariant RoomAsyncNotifier notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(RoomAsyncNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: RoomAsyncNotifierProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<RoomAsyncNotifier, Room>
      createElement() {
    return _RoomAsyncNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomAsyncNotifierProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RoomAsyncNotifierRef on AutoDisposeAsyncNotifierProviderRef<Room> {
  /// The parameter `id` of this provider.
  int get id;
}

class _RoomAsyncNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RoomAsyncNotifier, Room>
    with RoomAsyncNotifierRef {
  _RoomAsyncNotifierProviderElement(super.provider);

  @override
  int get id => (origin as RoomAsyncNotifierProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
