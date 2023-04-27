import 'package:riverpod_annotation/riverpod_annotation.dart';

class SharedReportNotifier extends AutoDisposeNotifier<bool> {
  @override
  bool build() {
    state = false;
    return state;
  }

  void reportWriting() {
    state = true;
  }
}

final sharedReportNotifierProvider =
    AutoDisposeNotifierProvider<SharedReportNotifier, bool>(
        SharedReportNotifier.new);
