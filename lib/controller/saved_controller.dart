import 'dart:async';

import 'package:four_hours_client/constants/constants.dart';
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

  void showSaved() {
    //애니메이션 효과를 위해 사라지게 했다가 다시 나타나도록
    hideSaved();

    state = true;
    _timer?.cancel();
    _timer = Timer(likeAndSavedHideDuration, () {
      hideSaved();
    });
  }

  void hideSaved() {
    state = false;
  }
}
