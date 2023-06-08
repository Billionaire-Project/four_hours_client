import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/models/posts_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'liked_post_controller.g.dart';

@riverpod
class LikedPostController extends _$LikedPostController {
  PostsRepository? postsRepository;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;

  @override
  Future<List<PostModel>> build() {
    _init();
    return getLikedPostsInitial();
  }

  String? _start = '0';
  final String _offset = '10';

  PostsModel? _likedPosts;
  PostsModel? get posts => _likedPosts;

  final bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<List<PostModel>> getLikedPostsInitial() async {
    state = const AsyncValue.loading();

    _start = '0';

    try {
      await Future.delayed(skeletonDelay, () async {
        //TODO: start를 두 번 초기화 해줘야하는 이슈
        _start = '0';

        await _fetchLikedPosts();
      });

      // state = _likedPosts!.posts;

      _start = _likedPosts!.next;

      state = AsyncData(_likedPosts!.posts);

      if (!state.hasValue) {
        debugPrint('List of Post is null');
        return [];
      }

      _refreshController.refreshCompleted();

      return state.value!.toList();
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  Future<void> getMoreLikedPosts() async {
    try {
      await _fetchLikedPosts();

      _start = _likedPosts!.next;

      state = AsyncData([...state.value!.toList(), ..._likedPosts!.posts]);

      _refreshController.loadComplete();
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
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

  Future<void> _fetchLikedPosts() async {
    if (_start == null) return;

    _likedPosts =
        await postsRepository!.getLikePosts(start: _start!, offset: _offset);
  }

  void _init() {
    postsRepository ??= ref.watch(postsRepositoryProvider);
    getLikedPostsInitial();
  }
}
