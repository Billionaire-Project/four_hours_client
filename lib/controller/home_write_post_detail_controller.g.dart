// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_write_post_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$writePostDetailControllerHash() =>
    r'eae5325a5a4e807c5d5c2aef5d2e69a569865784';

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

abstract class _$WritePostDetailController
    extends BuildlessAutoDisposeAsyncNotifier<PostModel?> {
  late final BuildContext context;
  late final PostModel post;

  Future<PostModel?> build(
    BuildContext context, {
    required PostModel post,
  });
}

/// See also [WritePostDetailController].
@ProviderFor(WritePostDetailController)
const writePostDetailControllerProvider = WritePostDetailControllerFamily();

/// See also [WritePostDetailController].
class WritePostDetailControllerFamily extends Family<AsyncValue<PostModel?>> {
  /// See also [WritePostDetailController].
  const WritePostDetailControllerFamily();

  /// See also [WritePostDetailController].
  WritePostDetailControllerProvider call(
    BuildContext context, {
    required PostModel post,
  }) {
    return WritePostDetailControllerProvider(
      context,
      post: post,
    );
  }

  @override
  WritePostDetailControllerProvider getProviderOverride(
    covariant WritePostDetailControllerProvider provider,
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
  String? get name => r'writePostDetailControllerProvider';
}

/// See also [WritePostDetailController].
class WritePostDetailControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WritePostDetailController,
        PostModel?> {
  /// See also [WritePostDetailController].
  WritePostDetailControllerProvider(
    this.context, {
    required this.post,
  }) : super.internal(
          () => WritePostDetailController()
            ..context = context
            ..post = post,
          from: writePostDetailControllerProvider,
          name: r'writePostDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$writePostDetailControllerHash,
          dependencies: WritePostDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              WritePostDetailControllerFamily._allTransitiveDependencies,
        );

  final BuildContext context;
  final PostModel post;

  @override
  bool operator ==(Object other) {
    return other is WritePostDetailControllerProvider &&
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
    covariant WritePostDetailController notifier,
  ) {
    return notifier.build(
      context,
      post: post,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
