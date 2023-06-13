import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:four_hours_client/controller/post_card_controller.dart';
import 'package:four_hours_client/controller/receipt_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/delete_post_screen/delete_post_page.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_detail_controller.g.dart';

@riverpod
class PostDetailController extends _$PostDetailController {
  @override
  Future<PostModel?> build({
    required PostModel post,
  }) {
    return _getPostByIdInitial();
  }

  void handlePressedMoreButton(
    BuildContext context, {
    required bool isMyPost,
  }) {
    if (isMyPost) {
      final deleteStack =
          ref.watch(receiptControllerProvider).value?.postDeleteStack ?? 0;

      showCommonActionSheet(
        actions: [
          CommonActionSheetAction(
            isDestructiveAction: true,
            onPressed: () async {
              closeRootNavigator();

              if (deleteStack >= 2) {
                showCommonToast(
                  context,
                  iconData: CustomIcons.warning_line,
                  text: '더 이상 글을 삭제할 수 없어요. 나중에 다시 시도해주세요.',
                  bottom: 40,
                );
                return;
              }

              await context.pushNamed(
                DeletePostPage.name,
                params: {
                  'postId': post.id.toString(),
                },
                extra: {
                  'isDetailPage': true,
                  'deleteStack': deleteStack,
                },
              );
            },
            iconData: CustomIcons.delete_bin_line,
            text: '게시글 삭제',
          ),
          CommonActionSheetAction(
            onPressed: () async {
              await saveToClipboard(post.content);
              if (context.mounted) {
                closeRootNavigator();

                showCommonToast(
                  context,
                  iconData: CustomIcons.check_line,
                  text: '클립보드에 복사되었어요!',
                  bottom: 40,
                );
              }
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
                      .read(
                          postCardControllerProvider(postId: post.id).notifier)
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
    state = const AsyncLoading();
    try {
      state = await AsyncValue.guard(_fetchPostDetail);

      if (state.hasError) {
        state = AsyncValue.error(
          '${state.error}',
          StackTrace.current,
        );
        printDebug(
          'PostDetailController',
          'State has an error ${state.error}',
        );
      }

      if (!state.hasValue) {
        printDebug('PostDetailController', 'State has no value');
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
