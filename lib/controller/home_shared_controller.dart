import 'package:dio/dio.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/models/post_detail_extra_model.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/models/posts_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/views/post_detail_screen/post_detail_page.dart';
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
  Future<List<PostModel>> build() {
    _init();
    return getPostsInitial();
  }

  String? _start = '0';
  final String _offset = '10';

  PostsModel? _posts;
  PostsModel? get posts => _posts;

  bool _isLoadingMore = false;

  Future<List<PostModel>> getPostsInitial() async {
    state = const AsyncValue.loading();

    _start = '0';

    try {
      await Future.delayed(skeletonDelay, () async {
        _posts = await _fetchSharedPosts();
      });

      _start = _posts!.next;

      state = AsyncData(_posts!.posts);

      if (!state.hasValue) {
        debugPrint('List of Post is null');
        return [];
      }

      return state.value!.toList();
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  Future<void> getMorePosts() async {
    try {
      _posts = await _fetchSharedPosts();

      if (_posts != null) {
        _start = _posts!.next;

        state = AsyncData([...state.value!.toList(), ..._posts!.posts]);
      }
      _refreshController.loadComplete();
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  void refreshTab() async {
    _start = '0';

    _posts = await _fetchSharedPosts();

    _start = _posts!.next;

    state = AsyncData(_posts!.posts);

    _refreshController.refreshCompleted();
  }

  void handlePressedCard(
    BuildContext context, {
    required PostModel post,
  }) {
    context.pushNamed(
      PostDetailPage.name,
      params: {
        'postId': post.id.toString(),
      },
      extra: PostDetailExtraModel(
        post: post,
      ),
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

  Future<void> handlePressedReportButton({required int postId}) async {
    try {
      await postsRepository!.reportPost(postId: postId);

      _replacePost(postId);
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  void _init() {
    postsRepository ??= ref.watch(postsRepositoryProvider);
    _scrollController.addListener(_handleScroll);
  }

  Future<void> _replacePost(int postId) async {
    try {
      final PostModel newPost =
          await postsRepository!.getPostById(postId: postId);
      final int targetIndex =
          state.value!.indexWhere((element) => element.id == postId);

      final List<PostModel> newSharedList = List.from(state.value!.toList());

      newSharedList[targetIndex] = newPost;

      state = AsyncData(newSharedList);
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

  Future<PostsModel?> _fetchSharedPosts() async {
    if (_start != null) {
      final PostsModel postsModel = await postsRepository!.getPosts(
        start: _start!,
        offset: _offset,
      );

      if (postsModel.posts.isEmpty) {
        state = const AsyncData([]);
      }

      return postsModel;
    } else {
      return null;
    }
  }
}
