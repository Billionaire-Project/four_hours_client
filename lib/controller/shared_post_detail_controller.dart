import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/home_shared_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';
import 'package:go_router/go_router.dart';

class SharedPostDetailController extends StateNotifier<PostModel?> {
  late StateNotifierProviderRef _ref;
  late PostsRepository _postsRepository;

  SharedPostDetailController(
    StateNotifierProviderRef ref, {
    required PostModel post,
  }) : super(post) {
    _ref = ref;
    _post = post;
    _postsRepository = _ref.read(postsRepositoryProvider);
    getPostById();
  }

  PostModel? _post;

  Future<void> getPostById() async {
    _post = await _postsRepository.getPostById(postId: _post!.id);
  }

  void handlePressedMoreButton(BuildContext context) {
    showCommonActionSheet(
      context,
      actions: [
        CommonActionSheetAction(
          isDestructiveAction: true,
          onPressed: () {
            closeRootNavigator(context);
            showCommonDialogWithTwoButtons(
              context,
              iconData: CustomIcons.report_fill,
              title: '해당 게시글을 신고하시겠어요?',
              subtitle: '신고가 접수되면 즉시 사라집니다',
              onPressedRightButton: () {
                context.pop();
                _ref
                    .read(homeSharedControllerProvider.notifier)
                    .handlePressedReportButton(postId: _post!.id);
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

final sharedPostDetailControllerProvider = StateNotifierProvider.family<
    SharedPostDetailController, PostModel?, PostModel>(
  (StateNotifierProviderRef ref, PostModel post) {
    return SharedPostDetailController(ref, post: post);
  },
);
