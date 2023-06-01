import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/models/my_posts_model.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/create_post_screen/create_post_page.dart';
import 'package:four_hours_client/views/delete_post_screen/delete_post_page.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_tab.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';
import 'package:four_hours_client/views/write_post_detail_screen/write_post_detail_page.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_write_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeWriteController extends _$HomeWriteController {
  late final PostsRepository postsRepository;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;

  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  @override
  Map<String, List<PostModel>> build() {
    _init();
    return state;
  }

  String? _start = '0';
  String _offset = '10';

  MyPostsModel? _myPosts;
  MyPostsModel? get posts => _myPosts;

  List<String> _dateList = [];
  List<String> get dateList => _dateList;

  bool _isLoadingMore = false;

  Future<bool> getMyPostsInitial() async {
    _start = '0';
    _offset = '10';

    try {
      if (_start == null) {
        _refreshController.refreshCompleted();
        return false;
      }

      _myPosts =
          await postsRepository.getMyPosts(start: _start!, offset: _offset);

      _start = _myPosts!.next;

      state = _myPosts!.posts;

      _dateList = _myPosts!.posts.keys.map((e) => e).toList();

      _refreshController.refreshCompleted();

      return true;
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  Future<void> getMoreMyPosts() async {
    try {
      if (_start == null) {
        _refreshController.loadComplete();
        return;
      }

      _myPosts =
          await postsRepository.getMyPosts(start: _start!, offset: _offset);

      if (_myPosts == null) {
        //TODO: my posts가 null일 경우 예외처리
      }

      _start = _myPosts!.next;

      _dateList = [
        ..._dateList,
        ..._myPosts!.posts.keys.map((e) => e).toList()
      ];

      state = {...state, ..._myPosts!.posts};

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
      WritePostDetailPage.name,
      params: {
        'postId': post.id.toString(),
      },
      extra: post,
    );
  }

  void handlePressedMoreButton(BuildContext context, PostModel post) {
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
            await saveToClipboard(post.content);
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

  void handlePressedWritePost(BuildContext context) async {
    bool? isCreatedPost = await context
        .push<bool?>('${HomeWriteTab.path}/${CreatePostPage.path}');

    if (isCreatedPost ?? false) {
      if (context.mounted) {
        Future.delayed(
          const Duration(milliseconds: 100),
          () {
            showCommonAlert(
              iconData: CustomIcons.check_line,
              text: '게시 되었어요!',
            );
          },
        );
      }
    }
  }

  void _init() async {
    state = {};

    postsRepository = ref.watch(postsRepositoryProvider);
    _scrollController.addListener(_handleScroll);
    getMyPostsInitial();
  }

  void _handleScroll() async {
    if (_start == null) return;
    if (_scrollController.position.pixels >
        _scrollController.position.maxScrollExtent - loadMoreOffset) {
      if (_isLoadingMore) {
        return;
      } else {
        _isLoadingMore = true;
        await getMoreMyPosts();
        _isLoadingMore = false;
      }
    }
  }
}
