import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'saved_controller.g.dart';

@riverpod
class SavedController extends _$SavedController {
  @override
  bool build() {
    state = false;
    return state;
  }

  Timer? _timer;

  void appearSaved() {
    state = true;
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 3), () {
      disappearSaved();
    });
  }

  void disappearSaved() {
    state = false;
  }
}
