import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_like_controller.freezed.dart';

class PostLikeController extends StateNotifier<bool> {
  late PostsRepository _postsRepository;
  late int _postDetailId;

  PostLikeController({
    required bool isLiked,
    required int postId,
    required PostsRepository postsRepository,
  }) : super(isLiked) {
    state = isLiked;
    _postDetailId = postId;
    _postsRepository = postsRepository;
  }

  void handlePressedLikeButton() async {
    state = !state;

    await _postsRepository.likePost(postId: _postDetailId);
  }
}

@freezed
class PostLikeControllerParameters with _$PostLikeControllerParameters {
  factory PostLikeControllerParameters({
    required bool isLiked,
    required int postId,
  }) = _PostLikeControllerParameters;
}

final postLikeControllerProvider = StateNotifierProvider.family<
    PostLikeController, bool, PostLikeControllerParameters>(
  (ref, PostLikeControllerParameters postLikeStateParameters) {
    final postsRepository = ref.watch(postsRepositoryProvider);

    return PostLikeController(
        isLiked: postLikeStateParameters.isLiked,
        postId: postLikeStateParameters.postId,
        postsRepository: postsRepository);
  },
);
