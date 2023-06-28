// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_shared_post_card_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPostCardControllerHash() =>
    r'767f905d4db015d3858c1630de6941210b697389';

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

abstract class _$SharedPostCardController
    extends BuildlessAutoDisposeAsyncNotifier<dynamic> {
  late final int postId;

  FutureOr<dynamic> build({
    required int postId,
  });
}

/// See also [SharedPostCardController].
@ProviderFor(SharedPostCardController)
const sharedPostCardControllerProvider = SharedPostCardControllerFamily();

/// See also [SharedPostCardController].
class SharedPostCardControllerFamily extends Family<AsyncValue<dynamic>> {
  /// See also [SharedPostCardController].
  const SharedPostCardControllerFamily();

  /// See also [SharedPostCardController].
  SharedPostCardControllerProvider call({
    required int postId,
  }) {
    return SharedPostCardControllerProvider(
      postId: postId,
    );
  }

  @override
  SharedPostCardControllerProvider getProviderOverride(
    covariant SharedPostCardControllerProvider provider,
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
  String? get name => r'sharedPostCardControllerProvider';
}

/// See also [SharedPostCardController].
class SharedPostCardControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SharedPostCardController,
        dynamic> {
  /// See also [SharedPostCardController].
  SharedPostCardControllerProvider({
    required this.postId,
  }) : super.internal(
          () => SharedPostCardController()..postId = postId,
          from: sharedPostCardControllerProvider,
          name: r'sharedPostCardControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sharedPostCardControllerHash,
          dependencies: SharedPostCardControllerFamily._dependencies,
          allTransitiveDependencies:
              SharedPostCardControllerFamily._allTransitiveDependencies,
        );

  final int postId;

  @override
  bool operator ==(Object other) {
    return other is SharedPostCardControllerProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<dynamic> runNotifierBuild(
    covariant SharedPostCardController notifier,
  ) {
    return notifier.build(
      postId: postId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
