// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_post_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPostDetailControllerHash() =>
    r'e021e2ccd76a0e0f37aeeb8da63ed8778c1cc53b';

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

typedef SharedPostDetailControllerRef
    = AutoDisposeProviderRef<SharedPostDetailController>;

/// See also [sharedPostDetailController].
@ProviderFor(sharedPostDetailController)
const sharedPostDetailControllerProvider = SharedPostDetailControllerFamily();

/// See also [sharedPostDetailController].
class SharedPostDetailControllerFamily
    extends Family<SharedPostDetailController> {
  /// See also [sharedPostDetailController].
  const SharedPostDetailControllerFamily();

  /// See also [sharedPostDetailController].
  SharedPostDetailControllerProvider call({
    required int postId,
  }) {
    return SharedPostDetailControllerProvider(
      postId: postId,
    );
  }

  @override
  SharedPostDetailControllerProvider getProviderOverride(
    covariant SharedPostDetailControllerProvider provider,
  ) {
    return call(
      postId: provider.postId,
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
  String? get name => r'sharedPostDetailControllerProvider';
}

/// See also [sharedPostDetailController].
class SharedPostDetailControllerProvider
    extends AutoDisposeProvider<SharedPostDetailController> {
  /// See also [sharedPostDetailController].
  SharedPostDetailControllerProvider({
    required this.postId,
  }) : super.internal(
          (ref) => sharedPostDetailController(
            ref,
            postId: postId,
          ),
          from: sharedPostDetailControllerProvider,
          name: r'sharedPostDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sharedPostDetailControllerHash,
          dependencies: SharedPostDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              SharedPostDetailControllerFamily._allTransitiveDependencies,
        );

  final int postId;

  @override
  bool operator ==(Object other) {
    return other is SharedPostDetailControllerProvider &&
        other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
