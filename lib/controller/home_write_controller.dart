import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/controller/receipt_controller.dart';
import 'package:four_hours_client/models/my_posts_model.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/create_post_screen/create_post_page.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_tab.dart';
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
  Future<Map<String, List<PostModel>>> build() {
    _init();
    return getMyPostsInitial();
  }

  String? _start = '0';
  final String _offset = '10';

  MyPostsModel? _myPosts;
  MyPostsModel? get posts => _myPosts;

  List<String> _postingDates = [];
  List<String> get postingDates => _postingDates;

  List<PostModel> _todayPosts = [];
  List<PostModel> get todayPosts => _todayPosts;

  bool _isLoadingMore = false;

  Future<Map<String, List<PostModel>>> getMyPostsInitial() async {
    state = const AsyncValue.loading();

    _start = '0';

    try {
      await Future.delayed(skeletonDelay, () async {
        _myPosts = await _fetchWritePosts();
      });

      final bool hasToday = _myPosts!.posts.containsKey('Today');

      if (!hasToday) {
        _todayPosts = [];
      } else {
        _todayPosts = _myPosts!.posts['Today']!;
      }

      _postingDates = _myPosts!.posts.keys
          .map((key) => key)
          .where((date) => date != 'Today')
          .toList();

      _start = _myPosts!.next;

      state = AsyncData(_myPosts!.posts);

      if (!state.hasValue) {
        return {};
      }

      _refreshController.refreshCompleted();

      return state.value!;
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  Future<void> getMoreMyPosts() async {
    try {
      _myPosts = await _fetchWritePosts();

      if (_myPosts != null) {
        _start = _myPosts!.next;

        _postingDates = [
          ..._postingDates,
          ..._myPosts!.posts.keys.map((e) => e).toList()
        ];

        state = AsyncData({...state.value!, ..._myPosts!.posts});
      }
      _refreshController.loadComplete();
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  void refreshTab() async {
    _start = '0';

    _myPosts = await _fetchWritePosts();

    _start = _myPosts!.next;

    state = AsyncData(_myPosts!.posts);

    await ref.read(receiptControllerProvider.notifier).getReceipt();

    _refreshController.refreshCompleted();
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
    postsRepository = ref.watch(postsRepositoryProvider);
    _scrollController.addListener(_handleScroll);
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

  Future<MyPostsModel?> _fetchWritePosts() async {
    if (_start != null) {
      final MyPostsModel myPostsModel = await postsRepository.getMyPosts(
        start: _start!,
        offset: _offset,
      );

      if (myPostsModel.posts.isEmpty) {
        state = const AsyncData({});
      }

      return myPostsModel;
    } else {
      return null;
    }
  }
}
