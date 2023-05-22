import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/delete_post_screen/delete_post_page.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';
import 'package:go_router/go_router.dart';

class WritePostDetailController extends StateNotifier<PostModel?> {
  WritePostDetailController(
    StateNotifierProviderRef ref, {
    required PostModel post,
  }) : super(post) {
    _post = post;
    _getPostByIdInitial();
  }

  PostModel? _post;

  void handlePressedMoreButton(BuildContext context) {
    showCommonActionSheet(
      context,
      actions: [
        CommonActionSheetAction(
          isDestructiveAction: true,
          onPressed: () {
            closeRootNavigator(context);
            //TODO: 글 삭제 페이지로 이동
            context.push(DeletePostPage.path);
          },
          iconData: CustomIcons.delete_bin_line,
          text: '게시글 삭제',
        ),
        CommonActionSheetAction(
          onPressed: () {},
          iconData: CustomIcons.copy_line,
          text: '글 내용 복사',
        ),
      ],
    );
  }

  Future<void> _getPostByIdInitial() async {
    state = _post;
  }
}

final writePostDetailControllerProvider = StateNotifierProvider.family<
    WritePostDetailController, PostModel?, PostModel>(
  (StateNotifierProviderRef ref, PostModel post) {
    return WritePostDetailController(ref, post: post);
  },
);
