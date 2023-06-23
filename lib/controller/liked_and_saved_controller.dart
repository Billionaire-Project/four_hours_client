import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'liked_and_saved_controller.g.dart';

@riverpod
class LikedAndSavedController extends _$LikedAndSavedController {
  @override
  bool build() {
    state = false;
    return state;
  }

  bool _shouldReset = false;
  bool get shouldReset => _shouldReset;

  void resetLikedAndSavedAnimation() {
    _shouldReset = true;
  }

  void forwardLikedAndSavedAnimation() {
    _shouldReset = false;
  }
}
