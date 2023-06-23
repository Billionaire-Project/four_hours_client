// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postDetailControllerHash() =>
    r'9021af8e620be930a964c25e6a54e1f74c604fa9';

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

abstract class _$PostDetailController
    extends BuildlessAutoDisposeAsyncNotifier<PostModel?> {
  late final BuildContext context;
  late final PostModel post;

  Future<PostModel?> build(
    BuildContext context, {
    required PostModel post,
  });
}

/// See also [PostDetailController].
@ProviderFor(PostDetailController)
const postDetailControllerProvider = PostDetailControllerFamily();

/// See also [PostDetailController].
class PostDetailControllerFamily extends Family<AsyncValue<PostModel?>> {
  /// See also [PostDetailController].
  const PostDetailControllerFamily();

  /// See also [PostDetailController].
  PostDetailControllerProvider call(
    BuildContext context, {
    required PostModel post,
  }) {
    return PostDetailControllerProvider(
      context,
      post: post,
    );
  }

  @override
  PostDetailControllerProvider getProviderOverride(
    covariant PostDetailControllerProvider provider,
  ) {
    return call(
      provider.context,
      post: provider.post,
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
  String? get name => r'postDetailControllerProvider';
}

/// See also [PostDetailController].
class PostDetailControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    PostDetailController, PostModel?> {
  /// See also [PostDetailController].
  PostDetailControllerProvider(
    this.context, {
    required this.post,
  }) : super.internal(
          () => PostDetailController()
            ..context = context
            ..post = post,
          from: postDetailControllerProvider,
          name: r'postDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postDetailControllerHash,
          dependencies: PostDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              PostDetailControllerFamily._allTransitiveDependencies,
        );

  final BuildContext context;
  final PostModel post;

  @override
  bool operator ==(Object other) {
    return other is PostDetailControllerProvider &&
        other.context == context &&
        other.post == post;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);
    hash = _SystemHash.combine(hash, post.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<PostModel?> runNotifierBuild(
    covariant PostDetailController notifier,
  ) {
    return notifier.build(
      context,
      post: post,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
