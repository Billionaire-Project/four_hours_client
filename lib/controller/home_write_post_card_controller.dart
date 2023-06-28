import 'package:four_hours_client/models/post_detail_extra_model.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/views/delete_post_screen/delete_post_page.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_post_detail_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';

part 'home_write_post_card_controller.g.dart';

@riverpod
class WritePostCardController extends _$WritePostCardController {
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
    context.pushNamed(
      WritePostDetailPage.name,
      params: {
        'postId': post.id.toString(),
      },
      extra: PostDetailExtraModel(
        post: post,
        time: time,
        postingDate: postingDate,
      ),
    );
  }

  void handlePressedMoreButton(
    BuildContext context, {
    required PostModel post,
  }) {
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
  }

  void _init() {
    postsRepository ??= ref.read(postsRepositoryProvider);
  }
}
