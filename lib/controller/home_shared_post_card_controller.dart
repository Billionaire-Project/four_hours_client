import 'package:dio/dio.dart';
import 'package:four_hours_client/controller/home_shared_controller.dart';
import 'package:four_hours_client/controller/home_write_controller.dart';
import 'package:four_hours_client/controller/receipt_controller.dart';
import 'package:four_hours_client/models/post_detail_extra_model.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/views/home_screen/shared_tab/home_shared_post_detail_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';

part 'home_shared_post_card_controller.g.dart';

@riverpod
class SharedPostCardController extends _$SharedPostCardController {
  PostsRepository? postsRepository;

  @override
  FutureOr build({required int postId}) {
    _init();
  }

  void handlePressedCard(
    BuildContext context, {
    required PostModel post,
    required String time,
    required String postingDate,
  }) async {
    bool isReadable = true;
    await ref.read(receiptControllerProvider.notifier).getReceipt();

    final asyncReceipt = ref.read(receiptControllerProvider);
    asyncReceipt.whenData((receipt) {
      isReadable = receipt!.isReadable;
    });

    if (!isReadable) {
      showCommonDialog(
        iconData: CustomIcons.time_line,
        title: '더이상 SHARED를 확인할 수 없어요',
        subtitle: '새로운 글을 쓰고 권한을 갱신해보세요!',
        onPressedButton: () async {
          await ref
              .read(homeSharedControllerProvider.notifier)
              .getPostsInitial();
          await ref
              .read(homeWriteControllerProvider.notifier)
              .getMyPostsInitial();
        },
      );
      return;
    } else {
      if (context.mounted) {
        bool? shouldShowDialog = await context.pushNamed<bool>(
          SharedPostDetailPage.name,
          params: {
            'postId': post.id.toString(),
          },
          extra: PostDetailExtraModel(
            post: post,
            time: time,
            postingDate: postingDate,
          ),
        );

        if (shouldShowDialog ?? false) {
          Future.delayed(const Duration(milliseconds: 300), () {
            showCommonDialog(
                iconData: CustomIcons.time_line,
                title: '유효하지 않은 게시글입니다',
                subtitle: '다른 글을 탐색하여 읽어보세요',
                onPressedButton: () async {
                  await ref
                      .read(homeSharedControllerProvider.notifier)
                      .getPostsInitial();
                  await ref
                      .read(homeWriteControllerProvider.notifier)
                      .getMyPostsInitial();
                });
          });
        }
      }
    }
  }

  void handlePressedMoreButton(
    BuildContext context, {
    required PostModel post,
  }) {
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

  Future<void> handlePressedReportButton() async {
    try {
      await postsRepository!.reportPost(postId: postId);

      final PostModel newPost = await _fetchPost();

      ref.read(homeSharedControllerProvider.notifier).replacePost(newPost);
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  Future<void> controlLike() async {
    try {
      await postsRepository!.likePost(postId: postId);

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
