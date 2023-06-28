// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_post_card_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$likedPostCardControllerHash() =>
    r'c0a6103283878ccfc592e07e71e0ef8b087345ac';

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

abstract class _$LikedPostCardController
    extends BuildlessAutoDisposeAsyncNotifier<dynamic> {
  late final int postId;

  FutureOr<dynamic> build({
    required int postId,
  });
}

/// See also [LikedPostCardController].
@ProviderFor(LikedPostCardController)
const likedPostCardControllerProvider = LikedPostCardControllerFamily();

/// See also [LikedPostCardController].
class LikedPostCardControllerFamily extends Family<AsyncValue<dynamic>> {
  /// See also [LikedPostCardController].
  const LikedPostCardControllerFamily();

  /// See also [LikedPostCardController].
  LikedPostCardControllerProvider call({
    required int postId,
  }) {
    return LikedPostCardControllerProvider(
      postId: postId,
    );
  }

  @override
  LikedPostCardControllerProvider getProviderOverride(
    covariant LikedPostCardControllerProvider provider,
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
  String? get name => r'likedPostCardControllerProvider';
}

/// See also [LikedPostCardController].
class LikedPostCardControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<LikedPostCardController,
        dynamic> {
  /// See also [LikedPostCardController].
  LikedPostCardControllerProvider({
    required this.postId,
  }) : super.internal(
          () => LikedPostCardController()..postId = postId,
          from: likedPostCardControllerProvider,
          name: r'likedPostCardControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$likedPostCardControllerHash,
          dependencies: LikedPostCardControllerFamily._dependencies,
          allTransitiveDependencies:
              LikedPostCardControllerFamily._allTransitiveDependencies,
        );

  final int postId;

  @override
  bool operator ==(Object other) {
    return other is LikedPostCardControllerProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<dynamic> runNotifierBuild(
    covariant LikedPostCardController notifier,
  ) {
    return notifier.build(
      postId: postId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
