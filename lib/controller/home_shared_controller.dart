import 'package:dio/dio.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/controller/receipt_controller.dart';
import 'package:four_hours_client/controller/saved_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/models/posts_pagination_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:four_hours_client/utils/functions.dart';

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

  PostsPaginationModel? _posts;
  PostsPaginationModel? get posts => _posts;

  bool _isLoadingMore = false;

  Future<List<PostModel>> getPostsInitial() async {
    ref.read(savedControllerProvider.notifier).resetSavedAnimation();

    state = const AsyncLoading();

    _start = '0';

    try {
      await Future.delayed(skeletonDelay, () async {
        _start = '0';

        _posts = await _fetchSharedPosts();
      });

      if (_posts == null) {
        state = AsyncValue.error(
          'The value of the post is null',
          StackTrace.current,
        );
        printDebug('HomeShardController', 'The value of the post is null');
      }

      _start = _posts!.next;

      state = AsyncData(_posts!.posts);

      if (state.hasError) {
        state = AsyncValue.error(
          '${state.error}',
          StackTrace.current,
        );
        printDebug(
          'HomeShardController',
          'State has an error ${state.error}',
        );
      }

      if (!state.hasValue) {
        printDebug('LikedPostsController', 'State has no value');
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

  Future<void> refreshTab() async {
    if (state.value == null) return;

    _start = '0';

    _posts = await _fetchSharedPosts();

    _start = _posts!.next;

    state = AsyncData(_posts!.posts);

    await ref.read(receiptControllerProvider.notifier).getReceipt();

    _refreshController.refreshCompleted();
  }

  void replacePost(PostModel newPost) async {
    final List<PostModel> newSharedList = List.from(state.value!.toList());

    final int targetIndex =
        state.value!.indexWhere((element) => element.id == newPost.id);

    newSharedList[targetIndex] = newPost;

    state = AsyncData(newSharedList);
  }

  void _init() {
    postsRepository ??= ref.watch(postsRepositoryProvider);
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
        await getMorePosts();
        _isLoadingMore = false;
      }
    }
  }

  Future<PostsPaginationModel?> _fetchSharedPosts() async {
    if (_start != null) {
      final PostsPaginationModel postsPaginationModel =
          await postsRepository!.getPosts(
        start: _start!,
        offset: _offset,
      );

      if (postsPaginationModel.posts.isEmpty) {
        state = const AsyncData([]);
      }

      return postsPaginationModel;
    } else {
      return null;
    }
  }
}
