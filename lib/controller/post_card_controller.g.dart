// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_card_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postCardControllerHash() =>
    r'f9b75f70cf5752d582d859edd9816c1c6399554e';

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

abstract class _$PostCardController
    extends BuildlessAutoDisposeAsyncNotifier<dynamic> {
  late final int postId;

  FutureOr<dynamic> build({
    required int postId,
  });
}

/// See also [PostCardController].
@ProviderFor(PostCardController)
const postCardControllerProvider = PostCardControllerFamily();

/// See also [PostCardController].
class PostCardControllerFamily extends Family<AsyncValue<dynamic>> {
  /// See also [PostCardController].
  const PostCardControllerFamily();

  /// See also [PostCardController].
  PostCardControllerProvider call({
    required int postId,
  }) {
    return PostCardControllerProvider(
      postId: postId,
    );
  }

  @override
  PostCardControllerProvider getProviderOverride(
    covariant PostCardControllerProvider provider,
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
  String? get name => r'postCardControllerProvider';
}

/// See also [PostCardController].
class PostCardControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PostCardController, dynamic> {
  /// See also [PostCardController].
  PostCardControllerProvider({
    required this.postId,
  }) : super.internal(
          () => PostCardController()..postId = postId,
          from: postCardControllerProvider,
          name: r'postCardControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postCardControllerHash,
          dependencies: PostCardControllerFamily._dependencies,
          allTransitiveDependencies:
              PostCardControllerFamily._allTransitiveDependencies,
        );

  final int postId;

  @override
  bool operator ==(Object other) {
    return other is PostCardControllerProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<dynamic> runNotifierBuild(
    covariant PostCardController notifier,
  ) {
    return notifier.build(
      postId: postId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
