import 'package:dio/dio.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'like_controller.g.dart';

@riverpod
class LikeController extends _$LikeController {
  @override
  bool build({
    required bool isLiked,
    required int postId,
  }) {
    state = isLiked;
    return state;
  }

  void handlePressedLikeButton() async {
    state = !state;

    state = await _likePost();
  }

  Future<bool> _likePost() async {
    try {
      bool isLiked =
          await ref.read(postsRepositoryProvider).likePost(postId: postId);

      return isLiked;
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }
}
