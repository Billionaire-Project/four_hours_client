import 'package:four_hours_client/constants/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'hide_liked_and_saved_controller.g.dart';

@riverpod
class HideLikedAndSavedController extends _$HideLikedAndSavedController {
  @override
  bool build() {
    state = false;
    return state;
  }

  void hideLikedAndSavedIfPageChanged() {
    state = true;
    Future.delayed(likeAnimationDuration, () {
      state = false;
    });
  }
}
