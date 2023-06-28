// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_write_post_card_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$writePostCardControllerHash() =>
    r'67093802beaeb199ecc77efa7bf4400f57f5ea8c';

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

abstract class _$WritePostCardController
    extends BuildlessAutoDisposeAsyncNotifier<dynamic> {
  late final int postId;

  FutureOr<dynamic> build({
    required int postId,
  });
}

/// See also [WritePostCardController].
@ProviderFor(WritePostCardController)
const writePostCardControllerProvider = WritePostCardControllerFamily();

/// See also [WritePostCardController].
class WritePostCardControllerFamily extends Family<AsyncValue<dynamic>> {
  /// See also [WritePostCardController].
  const WritePostCardControllerFamily();

  /// See also [WritePostCardController].
  WritePostCardControllerProvider call({
    required int postId,
  }) {
    return WritePostCardControllerProvider(
      postId: postId,
    );
  }

  @override
  WritePostCardControllerProvider getProviderOverride(
    covariant WritePostCardControllerProvider provider,
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
  String? get name => r'writePostCardControllerProvider';
}

/// See also [WritePostCardController].
class WritePostCardControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WritePostCardController,
        dynamic> {
  /// See also [WritePostCardController].
  WritePostCardControllerProvider({
    required this.postId,
  }) : super.internal(
          () => WritePostCardController()..postId = postId,
          from: writePostCardControllerProvider,
          name: r'writePostCardControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$writePostCardControllerHash,
          dependencies: WritePostCardControllerFamily._dependencies,
          allTransitiveDependencies:
              WritePostCardControllerFamily._allTransitiveDependencies,
        );

  final int postId;

  @override
  bool operator ==(Object other) {
    return other is WritePostCardControllerProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<dynamic> runNotifierBuild(
    covariant WritePostCardController notifier,
  ) {
    return notifier.build(
      postId: postId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
