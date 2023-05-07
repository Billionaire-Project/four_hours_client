// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_post_detail_page_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPostDetailPageControllerHash() =>
    r'3bd198862435168e88b0bcc05999f94abb65eb84';

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

typedef SharedPostDetailPageControllerRef
    = AutoDisposeProviderRef<SharedPostDetailPageController>;

/// See also [sharedPostDetailPageController].
@ProviderFor(sharedPostDetailPageController)
const sharedPostDetailPageControllerProvider =
    SharedPostDetailPageControllerFamily();

/// See also [sharedPostDetailPageController].
class SharedPostDetailPageControllerFamily
    extends Family<SharedPostDetailPageController> {
  /// See also [sharedPostDetailPageController].
  const SharedPostDetailPageControllerFamily();

  /// See also [sharedPostDetailPageController].
  SharedPostDetailPageControllerProvider call({
    required int postId,
  }) {
    return SharedPostDetailPageControllerProvider(
      postId: postId,
    );
  }

  @override
  SharedPostDetailPageControllerProvider getProviderOverride(
    covariant SharedPostDetailPageControllerProvider provider,
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
  String? get name => r'sharedPostDetailPageControllerProvider';
}

/// See also [sharedPostDetailPageController].
class SharedPostDetailPageControllerProvider
    extends AutoDisposeProvider<SharedPostDetailPageController> {
  /// See also [sharedPostDetailPageController].
  SharedPostDetailPageControllerProvider({
    required this.postId,
  }) : super.internal(
          (ref) => sharedPostDetailPageController(
            ref,
            postId: postId,
          ),
          from: sharedPostDetailPageControllerProvider,
          name: r'sharedPostDetailPageControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sharedPostDetailPageControllerHash,
          dependencies: SharedPostDetailPageControllerFamily._dependencies,
          allTransitiveDependencies:
              SharedPostDetailPageControllerFamily._allTransitiveDependencies,
        );

  final int postId;

  @override
  bool operator ==(Object other) {
    return other is SharedPostDetailPageControllerProvider &&
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
