// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_post_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deletePostControllerHash() =>
    r'aa113a869fe0be6a124b79fbddc506c7bc347650';

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

abstract class _$DeletePostController
    extends BuildlessAutoDisposeAsyncNotifier<List<DeleteReasonModel>> {
  late final int postId;

  Future<List<DeleteReasonModel>> build({
    required int postId,
  });
}

/// See also [DeletePostController].
@ProviderFor(DeletePostController)
const deletePostControllerProvider = DeletePostControllerFamily();

/// See also [DeletePostController].
class DeletePostControllerFamily
    extends Family<AsyncValue<List<DeleteReasonModel>>> {
  /// See also [DeletePostController].
  const DeletePostControllerFamily();

  /// See also [DeletePostController].
  DeletePostControllerProvider call({
    required int postId,
  }) {
    return DeletePostControllerProvider(
      postId: postId,
    );
  }

  @override
  DeletePostControllerProvider getProviderOverride(
    covariant DeletePostControllerProvider provider,
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
  String? get name => r'deletePostControllerProvider';
}

/// See also [DeletePostController].
class DeletePostControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    DeletePostController, List<DeleteReasonModel>> {
  /// See also [DeletePostController].
  DeletePostControllerProvider({
    required this.postId,
  }) : super.internal(
          () => DeletePostController()..postId = postId,
          from: deletePostControllerProvider,
          name: r'deletePostControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deletePostControllerHash,
          dependencies: DeletePostControllerFamily._dependencies,
          allTransitiveDependencies:
              DeletePostControllerFamily._allTransitiveDependencies,
        );

  final int postId;

  @override
  bool operator ==(Object other) {
    return other is DeletePostControllerProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<List<DeleteReasonModel>> runNotifierBuild(
    covariant DeletePostController notifier,
  ) {
    return notifier.build(
      postId: postId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
