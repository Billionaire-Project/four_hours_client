import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_like_controller.freezed.dart';

class PostLikeController extends StateNotifier<bool> {
  late StateNotifierProviderRef _ref;
  late PostsRepository _postsRepository;
  late int _postDetailId;

  PostLikeController(
    StateNotifierProviderRef ref, {
    required bool isLiked,
    required int postId,
  }) : super(isLiked) {
    _ref = ref;
    state = isLiked;
    _postDetailId = postId;
    _postsRepository = ref.read(postsRepositoryProvider);
  }

  void handlePressedLikeButton({bool isNeedRefresh = true}) async {
    state = !state;

    await _likePost();
  }

  Future<void> _likePost() async {
    try {
      bool isLiked = await _postsRepository.likePost(postId: _postDetailId);

      state = isLiked;
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
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
  (StateNotifierProviderRef ref,
      PostLikeControllerParameters postLikeStateParameters) {
    return PostLikeController(
      ref,
      isLiked: postLikeStateParameters.isLiked,
      postId: postLikeStateParameters.postId,
    );
  },
);
