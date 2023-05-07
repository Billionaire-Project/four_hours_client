import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';

part 'home_shared_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeSharedController extends _$HomeSharedController {
  late final PostsRepository postsRepository;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;
  @override
  AsyncValue<List<PostModel>> build() {
    _init();
    return state;
  }

  Future<void> getPosts() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      return await postsRepository.getPosts();
    });
  }

  void refreshSharedList() async {
    state = await AsyncValue.guard(() async {
      return await postsRepository.getPosts();
    });
    _refreshController.refreshCompleted();
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
                ref
                    .read(sharedPageReportControllerProvider.notifier)
                    .reportPost();
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

  void _init() {
    postsRepository = ref.watch(postsRepositoryProvider);
    getPosts();
  }
}

@riverpod
class SharedPageReportController extends _$SharedPageReportController {
  @override
  bool build() {
    return false;
  }

  void reportPost() {
    state = true;
  }
}
