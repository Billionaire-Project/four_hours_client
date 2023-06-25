// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$likeControllerHash() => r'98a86a07dd69abe145e97147898ef658026832db';

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

abstract class _$LikeController extends BuildlessAutoDisposeNotifier<bool> {
  late final bool isLiked;
  late final int postId;

  bool build({
    required bool isLiked,
    required int postId,
  });
}

/// See also [LikeController].
@ProviderFor(LikeController)
const likeControllerProvider = LikeControllerFamily();

/// See also [LikeController].
class LikeControllerFamily extends Family<bool> {
  /// See also [LikeController].
  const LikeControllerFamily();

  /// See also [LikeController].
  LikeControllerProvider call({
    required bool isLiked,
    required int postId,
  }) {
    return LikeControllerProvider(
      isLiked: isLiked,
      postId: postId,
    );
  }

  @override
  LikeControllerProvider getProviderOverride(
    covariant LikeControllerProvider provider,
  ) {
    return call(
      isLiked: provider.isLiked,
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
  String? get name => r'likeControllerProvider';
}

/// See also [LikeController].
class LikeControllerProvider
    extends AutoDisposeNotifierProviderImpl<LikeController, bool> {
  /// See also [LikeController].
  LikeControllerProvider({
    required this.isLiked,
    required this.postId,
  }) : super.internal(
          () => LikeController()
            ..isLiked = isLiked
            ..postId = postId,
          from: likeControllerProvider,
          name: r'likeControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$likeControllerHash,
          dependencies: LikeControllerFamily._dependencies,
          allTransitiveDependencies:
              LikeControllerFamily._allTransitiveDependencies,
        );

  final bool isLiked;
  final int postId;

  @override
  bool operator ==(Object other) {
    return other is LikeControllerProvider &&
        other.isLiked == isLiked &&
        other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isLiked.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  bool runNotifierBuild(
    covariant LikeController notifier,
  ) {
    return notifier.build(
      isLiked: isLiked,
      postId: postId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
