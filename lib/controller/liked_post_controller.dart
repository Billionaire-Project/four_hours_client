import 'package:dio/dio.dart';
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
  List<PostModel> build() {
    state = [];

    _init();
    return state;
  }

  String _start = '0';
  String _offset = '10';

  PostsModel? _likedPosts;
  PostsModel? get posts => _likedPosts;

  Future<void> getLikedPostsInitial() async {
    try {
      await _getLikePosts();

      //TODO: 에러 핸들링 필요
      if (_likedPosts!.posts.isEmpty || _likedPosts!.next == null) {
        return;
      }

      state = _likedPosts!.posts;

      _start = _likedPosts!.next!;
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  Future<void> getMoreLikedPosts() async {
    try {
      await _getLikePosts();

      if (_likedPosts!.next == null) {
        _refreshController.loadComplete();
        return;
      }

      _start = _likedPosts!.next!;
      state = [
        ...state,
        ..._likedPosts!.posts,
      ];

      _refreshController.loadComplete();
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  Future<void> refreshLikedList() async {
    _start = '0';
    _offset = '10';

    try {
      await _getLikePosts();

      state = _likedPosts!.posts;

      _refreshController.refreshCompleted();
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  Future<void> _getLikePosts() async {
    _likedPosts =
        await postsRepository!.getLikePosts(start: _start, offset: _offset);
  }

  void _init() {
    postsRepository ??= ref.watch(postsRepositoryProvider);
    getLikedPostsInitial();
  }
}
