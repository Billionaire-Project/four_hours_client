import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_controller.freezed.dart';

class LikeController extends StateNotifier<bool> {
  late StateNotifierProviderRef _ref;
  late PostsRepository _postsRepository;
  late int _postDetailId;

  LikeController(
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
class LikeControllerParameters with _$LikeControllerParameters {
  factory LikeControllerParameters({
    required bool isLiked,
    required int postId,
  }) = _LikeControllerParameters;
}

final likeControllerProvider = StateNotifierProvider.family<LikeController,
    bool, LikeControllerParameters>(
  (StateNotifierProviderRef ref, LikeControllerParameters likeStateParameters) {
    return LikeController(
      ref,
      isLiked: likeStateParameters.isLiked,
      postId: likeStateParameters.postId,
    );
  },
);
