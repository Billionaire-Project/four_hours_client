import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'liked_post_detail_controller.g.dart';

@riverpod
class LikedPostDetailController extends _$LikedPostDetailController {
  @override
  Future<PostModel?> build(
    BuildContext context, {
    required PostModel post,
  }) {
    return _getPostByIdInitial();
  }

  void handlePressedMoreButton() {
    showCommonActionSheet(
      actions: [
        CommonActionSheetAction(
          onPressed: () async {
            closeRootNavigator();
            await saveTextToClipboard(context, text: post.content);
          },
          iconData: CustomIcons.copy_line,
          text: '글 내용 복사',
        ),
      ],
    );
  }

  Future<PostModel?> _getPostByIdInitial() async {
    state = const AsyncLoading();
    try {
      state = await AsyncValue.guard(_fetchPostDetail);

      if (state.hasError) {
        state = AsyncValue.error(
          '${state.error}',
          StackTrace.current,
        );
        printDebug(
          'LikedPostDetailController',
          'State has an error ${state.error}',
        );
        return null;
      }

      if (!state.hasValue) {
        printDebug('LikedPostDetailController', 'State has no value');
        return null;
      }

      return state.value;
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  Future<PostModel> _fetchPostDetail() async {
    return await ref.read(postsRepositoryProvider).getPostById(postId: post.id);
  }
}
