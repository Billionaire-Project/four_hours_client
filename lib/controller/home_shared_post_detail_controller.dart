import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:four_hours_client/controller/home_shared_post_card_controller.dart';
import 'package:four_hours_client/controller/liked_and_saved_controller.dart';
import 'package:four_hours_client/controller/saved_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_shared_post_detail_controller.g.dart';

@riverpod
class SharedPostDetailController extends _$SharedPostDetailController {
  @override
  Future<PostModel?> build(
    BuildContext context, {
    required PostModel post,
  }) {
    return _getPostByIdInitial();
  }

  void handlePressedMoreButton() {
    bool isMyPost = post.isOwner;

    if (isMyPost) {
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
    } else {
      showCommonActionSheet(
        actions: [
          CommonActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              closeRootNavigator();
              showCommonDialogWithTwoButtons(
                iconData: CustomIcons.report_fill,
                title: '해당 게시글을 신고하시겠어요?',
                subtitle: '신고가 접수되면 즉시 사라집니다',
                onPressedRightButton: () {
                  context.pop();
                  ref
                      .read(sharedPostCardControllerProvider(postId: post.id)
                          .notifier)
                      .handlePressedReportButton();
                },
                rightButtonText: '신고',
              );
            },
            iconData: CustomIcons.report_line,
            text: '게시글 신고',
          )
        ],
      );
    }
  }

  Future<PostModel?> _getPostByIdInitial() async {
    ref.read(savedControllerProvider.notifier).resetSavedAnimation();
    ref
        .read(likedAndSavedControllerProvider.notifier)
        .resetLikedAndSavedAnimation();

    state = const AsyncLoading();
    try {
      state = await AsyncValue.guard(_fetchPostDetail);

      if (state.hasError) {
        state = AsyncValue.error(
          '${state.error}',
          StackTrace.current,
        );
        printDebug(
          'SharedPostDetailController',
          'State has an error ${state.error}',
        );
        return null;
      }

      if (!state.hasValue) {
        printDebug('SharedPostDetailController', 'State has no value');
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
