import 'package:dio/dio.dart';
import 'package:four_hours_client/controller/home_shared_controller.dart';
import 'package:four_hours_client/models/post_detail_extra_model.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/views/post_detail_screen/post_detail_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';

part 'post_card_controller.g.dart';

@riverpod
class PostCardController extends _$PostCardController {
  PostsRepository? postsRepository;

  @override
  FutureOr build({required int postId}) {
    _init();
  }

  void handlePressedCard(
    BuildContext context, {
    required PostModel post,
    bool isNeedBottom = false,
  }) {
    context.pushNamed(
      PostDetailPage.name,
      params: {
        'postId': post.id.toString(),
      },
      extra: PostDetailExtraModel(
        post: post,
        isNeedBottom: isNeedBottom,
      ),
    );
  }

  void handlePressedMoreButton({
    required List<CommonActionSheetAction> actions,
  }) {
    showCommonActionSheet(
      actions: actions,
    );
  }

  Future<void> handlePressedReportButton() async {
    try {
      await postsRepository!.reportPost(postId: postId);

      final PostModel newPost = await _fetchPost();

      ref.read(homeSharedControllerProvider.notifier).replacePost(newPost);
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  void _init() {
    postsRepository ??= ref.read(postsRepositoryProvider);
  }

  Future<PostModel> _fetchPost() async {
    final PostModel postModel =
        await postsRepository!.getPostById(postId: postId);

    return postModel;
  }

  Future<void> _replacePost() async {
    try {
      state = await AsyncValue.guard(_fetchPost);
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }
}
