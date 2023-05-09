import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/models/posts_model.dart';
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
  List<PostModel> build() {
    state = [];

    _init();
    return state;
  }

  String _start = '0';
  String _offset = '10';

  PostsModel? _posts;
  PostsModel? get posts => _posts;

  Future<void> getPostsInitial() async {
    await _getPosts();

    //TODO: 에러 핸들링 필요
    if (_posts!.posts.isEmpty || _posts!.next == null) {
      return;
    }

    state = _posts!.posts;

    _start = _posts!.next!;
  }

  Future<void> getMorePosts() async {
    await _getPosts();

    if (_posts!.next == null) {
      _refreshController.loadComplete();
      return;
    }

    _start = _posts!.next!;
    state = [...state, ..._posts!.posts];

    _refreshController.loadComplete();
  }

  void refreshSharedList() async {
    _start = '0';
    _offset = '10';

    await _getPosts();

    state = _posts!.posts;

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

  Future<void> handlePressedLikeButton(int postId) async {
    await postsRepository.likePost(postId: postId);

    final PostModel newPost = await postsRepository.getPostById(postId: postId);

    final int targetIndex = state.indexWhere((element) => element.id == postId);

    final List<PostModel> newSharedList = List.from(state);

    newSharedList[targetIndex] = newPost;

    state = newSharedList;
  }

  void _init() {
    postsRepository = ref.watch(postsRepositoryProvider);
    getPostsInitial();
  }

  Future<void> _getPosts() async {
    _posts = await postsRepository.getPosts(start: _start, offset: _offset);
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
