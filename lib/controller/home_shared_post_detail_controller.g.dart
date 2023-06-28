// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_shared_post_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPostDetailControllerHash() =>
    r'7aa1528bbb87c81cf4542d2648f3652024a834de';

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

abstract class _$SharedPostDetailController
    extends BuildlessAutoDisposeAsyncNotifier<PostModel?> {
  late final BuildContext context;
  late final PostModel post;

  Future<PostModel?> build(
    BuildContext context, {
    required PostModel post,
  });
}

/// See also [SharedPostDetailController].
@ProviderFor(SharedPostDetailController)
const sharedPostDetailControllerProvider = SharedPostDetailControllerFamily();

/// See also [SharedPostDetailController].
class SharedPostDetailControllerFamily extends Family<AsyncValue<PostModel?>> {
  /// See also [SharedPostDetailController].
  const SharedPostDetailControllerFamily();

  /// See also [SharedPostDetailController].
  SharedPostDetailControllerProvider call(
    BuildContext context, {
    required PostModel post,
  }) {
    return SharedPostDetailControllerProvider(
      context,
      post: post,
    );
  }

  @override
  SharedPostDetailControllerProvider getProviderOverride(
    covariant SharedPostDetailControllerProvider provider,
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
  String? get name => r'sharedPostDetailControllerProvider';
}

/// See also [SharedPostDetailController].
class SharedPostDetailControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SharedPostDetailController,
        PostModel?> {
  /// See also [SharedPostDetailController].
  SharedPostDetailControllerProvider(
    this.context, {
    required this.post,
  }) : super.internal(
          () => SharedPostDetailController()
            ..context = context
            ..post = post,
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

  final BuildContext context;
  final PostModel post;

  @override
  bool operator ==(Object other) {
    return other is SharedPostDetailControllerProvider &&
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
    covariant SharedPostDetailController notifier,
  ) {
    return notifier.build(
      context,
      post: post,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
