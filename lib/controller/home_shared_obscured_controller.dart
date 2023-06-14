import 'package:dio/dio.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/controller/receipt_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/models/posts_obscured_pagination_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:four_hours_client/utils/functions.dart';

part 'home_shared_obscured_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeSharedObscuredController extends _$HomeSharedObscuredController {
  PostsRepository? postsRepository;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;

  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  @override
  Future<List<PostModel>> build() {
    _init();
    return getObscuredPostsInitial();
  }

  String? _start = '0';
  final String _offset = '10';

  PostsObscuredPaginationModel? _obscuredPosts;
  PostsObscuredPaginationModel? get obscuredPosts => _obscuredPosts;

  bool _isLoadingMore = false;

  Future<List<PostModel>> getObscuredPostsInitial() async {
    state = const AsyncLoading();

    _start = '0';

    try {
      await Future.delayed(skeletonDelay, () async {
        _obscuredPosts = await _fetchObscuredPosts();

        _start = _obscuredPosts!.next;

        state = AsyncData(_obscuredPosts!.posts);
      });

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
        printDebug('HomeSharedController', 'State has no value');
        return [];
      }

      return state.value!.toList();
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  Future<void> getMoreObscuredPosts() async {
    try {
      _obscuredPosts = await _fetchObscuredPosts();

      if (_obscuredPosts != null) {
        _start = _obscuredPosts!.next;

        state = AsyncData([...state.value!.toList(), ..._obscuredPosts!.posts]);
      }
      _refreshController.loadComplete();
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  void refreshTab() async {
    _start = '0';

    _obscuredPosts = await _fetchObscuredPosts();

    _start = _obscuredPosts!.next;

    state = AsyncData(_obscuredPosts!.posts);

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
        await getMoreObscuredPosts();
        _isLoadingMore = false;
      }
    }
  }

  Future<PostsObscuredPaginationModel?> _fetchObscuredPosts() async {
    if (_start != null) {
      final PostsObscuredPaginationModel obscuredPaginationModel =
          await postsRepository!.getPostObscured(
        start: _start!,
        offset: _offset,
      );

      if (obscuredPaginationModel.posts.isEmpty) {
        state = const AsyncData([]);
      }

      return obscuredPaginationModel;
    } else {
      return null;
    }
  }
}
