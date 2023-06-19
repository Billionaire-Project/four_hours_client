import 'package:dio/dio.dart';
import 'package:four_hours_client/controller/home_shared_controller.dart';
import 'package:four_hours_client/models/post_detail_extra_model.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/views/delete_post_screen/delete_post_page.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_tab.dart';
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
  }) {
    bool isFromMyPost = GoRouter.of(context).location == HomeWriteTab.path;

    context.pushNamed(
      PostDetailPage.name,
      params: {
        'postId': post.id.toString(),
      },
      extra: PostDetailExtraModel(
        post: post,
        isFromMyPost: isFromMyPost,
      ),
    );
  }

  void handlePressedMoreButton(
    BuildContext context, {
    required PostModel post,
  }) {
    bool isFromMyPost = GoRouter.of(context).location == HomeWriteTab.path;

    if (isFromMyPost) {
      showCommonActionSheet(
        actions: [
          CommonActionSheetAction(
            isDestructiveAction: true,
            onPressed: () async {
              closeRootNavigator();

              await context.pushNamed(
                DeletePostPage.name,
                params: {
                  'postId': post.id.toString(),
                },
              );
            },
            iconData: CustomIcons.delete_bin_line,
            text: '게시글 삭제',
          ),
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
                  onPressedRightButton: handlePressedReportButton,
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
}
