import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/delete_post_screen/delete_post_page.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';
import 'package:go_router/go_router.dart';

class WritePostDetailController extends StateNotifier<PostModel?> {
  late StateNotifierProviderRef _ref;
  late PostsRepository _postsRepository;

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
      actions: [
        CommonActionSheetAction(
          isDestructiveAction: true,
          onPressed: () async {
            closeRootNavigator();

            await context.pushNamed(DeletePostPage.name, params: {
              'postId': _post!.id.toString(),
            }, extra: {
              'isDetailPage': true,
            });
          },
          iconData: CustomIcons.delete_bin_line,
          text: '게시글 삭제',
        ),
        CommonActionSheetAction(
          onPressed: () async {
            await saveToClipboard(_post!.content);
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
  }

  Future<void> _getPostByIdInitial() async {
    state = _post;
  }
}

final writePostDetailControllerProvider = StateNotifierProvider.autoDispose
    .family<WritePostDetailController, PostModel?, PostModel>(
  (StateNotifierProviderRef ref, PostModel post) {
    return WritePostDetailController(ref, post: post);
  },
);
