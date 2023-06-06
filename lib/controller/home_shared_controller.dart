import 'package:dio/dio.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/controller/liked_post_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/models/posts_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/views/shared_post_detail_screen/shared_post_detail_page.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';

part 'home_shared_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeSharedController extends _$HomeSharedController {
  PostsRepository? postsRepository;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;

  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  @override
  List<PostModel> build() {
    _init();
    return state;
  }

  String? _start = '0';
  String _offset = '10';

  PostsModel? _posts;
  PostsModel? get posts => _posts;

  bool _isLoadingMore = false;

  Future<void> getPostsInitial() async {
    _start = '0';
    _offset = '10';
    try {
      if (_start == null) {
        _refreshController.refreshCompleted();
        return;
      }
      _posts = await postsRepository!.getPosts(start: _start!, offset: _offset);

      if (_posts!.posts.isEmpty) {
        //TODO: 에러 핸들링 필요
        throw ('posts are empty');
      }

      state = _posts!.posts;

      _start = _posts!.next;

      _refreshController.refreshCompleted();
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  Future<void> getMorePosts() async {
    try {
      _posts = await postsRepository!.getPosts(start: _start!, offset: _offset);

      if (_posts!.next == null) {
        _refreshController.loadComplete();
        return;
      }

      _start = _posts!.next!;
      state = [...state, ..._posts!.posts];

      _refreshController.loadComplete();
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  void handlePressedCard(
    BuildContext context, {
    required PostModel post,
  }) {
    context.pushNamed(
      SharedPostDetailPage.name,
      params: {
        'postId': post.id.toString(),
      },
      extra: post,
    );
  }

  void handlePressedMoreButton(BuildContext context, {required int postId}) {
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
                handlePressedReportButton(postId: postId);
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

  Future<void> handlePressedLikeButton({
    required int postId,
  }) async {
    try {
      await postsRepository!.likePost(postId: postId);

      await replacePost(postId);

      ref.read(likedPostControllerProvider.notifier).getLikedPostsInitial();
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  Future<void> handlePressedReportButton({required int postId}) async {
    try {
      await postsRepository!.reportPost(postId: postId);

      replacePost(postId);
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  void _init() {
    state = [];

    postsRepository ??= ref.watch(postsRepositoryProvider);
    _scrollController.addListener(_handleScroll);
    getPostsInitial();
  }

  Future<void> replacePost(int postId) async {
    try {
      final PostModel newPost =
          await postsRepository!.getPostById(postId: postId);
      final int targetIndex =
          state.indexWhere((element) => element.id == postId);

      final List<PostModel> newSharedList = List.from(state);
//! state에 해당 포스트가 없는데 replace할 수가 없지
      newSharedList[targetIndex] = newPost;

      state = newSharedList;
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  void _handleScroll() async {
    if (_start == null) return;
    if (_scrollController.position.pixels >
        _scrollController.position.maxScrollExtent - loadMoreOffset) {
      if (_isLoadingMore) {
        return;
      } else {
        _isLoadingMore = true;
        await getMorePosts();
        _isLoadingMore = false;
      }
    }
  }
}
