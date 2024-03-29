import 'dart:async';

import 'package:dio/dio.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/controller/liked_and_saved_controller.dart';
import 'package:four_hours_client/controller/saved_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/models/posts_pagination_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'liked_posts_controller.g.dart';

@riverpod
class LikedPostsController extends _$LikedPostsController {
  PostsRepository? postsRepository;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;

  @override
  Future<List<PostModel>> build() {
    _init();
    return getLikedPostsInitial();
  }

  String? _start;
  final String _offset = '10';

  PostsPaginationModel? _likedPosts;
  PostsPaginationModel? get posts => _likedPosts;

  List<String> _postingDates = [];
  List<String> get postingDates => _postingDates;

  Future<List<PostModel>> getLikedPostsInitial() async {
    state = const AsyncLoading();

    _start = '0';

    try {
      await Future.delayed(skeletonDelay, () async {
        _start = '0';

        _likedPosts = await _fetchLikedPosts();
      });

      _start = _likedPosts!.next;

      state = AsyncData(_likedPosts!.posts);

      _postingDates = _likedPosts!.posts.map((post) {
        final String postingDate = getPostingDate(post.createdAt);

        return postingDate;
      }).toList();

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

  Future<void> getMoreLikedPosts() async {
    try {
      _likedPosts = await _fetchLikedPosts();

      if (_likedPosts != null) {
        _postingDates = [
          ..._postingDates,
          ..._likedPosts!.posts.map((post) {
            final String postingDate = getPostingDate(post.createdAt);

            return postingDate;
          }).toList()
        ];
        _start = _likedPosts!.next;

        state = AsyncData([...state.value!.toList(), ..._likedPosts!.posts]);
      }

      _refreshController.loadComplete();
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  void refreshLiked() async {
    _start = '0';

    _likedPosts = await _fetchLikedPosts();

    _postingDates = _likedPosts!.posts.map((post) {
      final String postingDate = getPostingDate(post.createdAt);

      return postingDate;
    }).toList();

    _start = _likedPosts!.next;

    state = AsyncData(_likedPosts!.posts);

    _refreshController.refreshCompleted();
  }

  Future<PostsPaginationModel?> _fetchLikedPosts() async {
    if (_start != null) {
      final PostsPaginationModel postsPaginationModel =
          await postsRepository!.getLikePosts(
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

  String getPostingDate(String postingDate) {
    final createdAt = DateTime.parse(postingDate).toLocal();
    final year = DateFormat.y().format(createdAt);
    final month = DateFormat.M().format(createdAt).padLeft(2, '0');
    final day = DateFormat.d().format(createdAt);

    return '$year.$month.$day';
  }

  void _init() {
    ref.read(savedControllerProvider.notifier).resetSavedAnimation();
    ref
        .read(likedAndSavedControllerProvider.notifier)
        .resetLikedAndSavedAnimation();

    postsRepository ??= ref.watch(postsRepositoryProvider);
  }
}
