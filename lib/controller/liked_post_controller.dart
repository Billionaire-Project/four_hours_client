import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/models/posts_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'liked_post_controller.g.dart';

@Riverpod(keepAlive: true)
class LikedPostController extends _$LikedPostController {
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

  PostsModel? _likedPosts;
  PostsModel? get posts => _likedPosts;

  Future<void> getLikedPostsInitial() async {
    await _getLikePosts();

    //TODO: 에러 핸들링 필요
    if (_likedPosts!.posts.isEmpty || _likedPosts!.next == null) {
      return;
    }

    state = _likedPosts!.posts;

    _start = _likedPosts!.next!;
  }

  Future<void> getMoreLikedPosts() async {
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
  }

  void refreshLikedList() async {
    _start = '0';
    _offset = '10';

    await _getLikePosts();

    state = _likedPosts!.posts;

    _refreshController.refreshCompleted();
  }

  Future<void> handlePressedLikeButton(int postId) async {
    await postsRepository.likePost(postId: postId);

    final PostModel newPost = await postsRepository.getPostById(postId: postId);

    final int targetIndex = state.indexWhere((element) => element.id == postId);

    final List<PostModel> newSharedList = List.from(state);

    newSharedList[targetIndex] = newPost;

    state = newSharedList;
  }

  Future<void> _getLikePosts() async {
    _likedPosts =
        await postsRepository.getLikePosts(start: _start, offset: _offset);
  }

  void _init() {
    postsRepository = ref.watch(postsRepositoryProvider);
    getLikedPostsInitial();
  }
}