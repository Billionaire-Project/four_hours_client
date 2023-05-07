// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_page_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPageControllerHash() =>
    r'5afd2f8bd915fe9d0fa0d6d97ab6d24552dcda63';

/// See also [SharedPageController].
@ProviderFor(SharedPageController)
final sharedPageControllerProvider =
    NotifierProvider<SharedPageController, List<PostModel>>.internal(
  SharedPageController.new,
  name: r'sharedPageControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPageControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SharedPageController = Notifier<List<PostModel>>;
String _$sharedPageReportControllerHash() =>
    r'2afffc2661aa9a6bf817b6784ea86fc6ac2002bd';

/// See also [SharedPageReportController].
@ProviderFor(SharedPageReportController)
final sharedPageReportControllerProvider =
    AutoDisposeNotifierProvider<SharedPageReportController, bool>.internal(
  SharedPageReportController.new,
  name: r'sharedPageReportControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPageReportControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SharedPageReportController = AutoDisposeNotifier<bool>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
