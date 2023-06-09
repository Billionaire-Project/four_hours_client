// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'write_timer_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$writeTimerControllerHash() =>
    r'50e3741cc39764207aba9412026cd1387ff717d7';

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

abstract class _$WriteTimerController
    extends BuildlessAutoDisposeNotifier<double> {
  late final AsyncValue<ReceiptModel> asyncReceipt;

  double build({
    required AsyncValue<ReceiptModel> asyncReceipt,
  });
}

/// See also [WriteTimerController].
@ProviderFor(WriteTimerController)
const writeTimerControllerProvider = WriteTimerControllerFamily();

/// See also [WriteTimerController].
class WriteTimerControllerFamily extends Family<double> {
  /// See also [WriteTimerController].
  const WriteTimerControllerFamily();

  /// See also [WriteTimerController].
  WriteTimerControllerProvider call({
    required AsyncValue<ReceiptModel> asyncReceipt,
  }) {
    return WriteTimerControllerProvider(
      asyncReceipt: asyncReceipt,
    );
  }

  @override
  WriteTimerControllerProvider getProviderOverride(
    covariant WriteTimerControllerProvider provider,
  ) {
    return call(
      asyncReceipt: provider.asyncReceipt,
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
  String? get name => r'writeTimerControllerProvider';
}

/// See also [WriteTimerController].
class WriteTimerControllerProvider
    extends AutoDisposeNotifierProviderImpl<WriteTimerController, double> {
  /// See also [WriteTimerController].
  WriteTimerControllerProvider({
    required this.asyncReceipt,
  }) : super.internal(
          () => WriteTimerController()..asyncReceipt = asyncReceipt,
          from: writeTimerControllerProvider,
          name: r'writeTimerControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$writeTimerControllerHash,
          dependencies: WriteTimerControllerFamily._dependencies,
          allTransitiveDependencies:
              WriteTimerControllerFamily._allTransitiveDependencies,
        );

  final AsyncValue<ReceiptModel> asyncReceipt;

  @override
  bool operator ==(Object other) {
    return other is WriteTimerControllerProvider &&
        other.asyncReceipt == asyncReceipt;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, asyncReceipt.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  double runNotifierBuild(
    covariant WriteTimerController notifier,
  ) {
    return notifier.build(
      asyncReceipt: asyncReceipt,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
