import 'package:four_hours_client/models/my_posts_model.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_write_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeWriteController extends _$HomeWriteController {
  late final PostsRepository postsRepository;

  @override
  Map<String, List<PostModel>> build() {
    _init();
    return state;
  }

  String _start = '0';
  String _offset = '10';

  MyPostsModel? _myPosts;
  MyPostsModel? get posts => _myPosts;

  List<String>? _dateList;
  List<String>? get dateList => _dateList;

  Future<void> getMyPostsInitial() async {
    await _getMyPosts();

    //TODO: 에러 핸들링 필요
    if (_myPosts!.posts.isEmpty || _myPosts!.next == null) {
      return;
    }

    state = _myPosts!.posts;

    _start = _myPosts!.next!;

    _dateList = _myPosts!.posts.keys.map((e) => e).toList();
  }

  Future<void> refreshWriteList() async {
    _start = '0';
    _offset = '10';

    await _getMyPosts();

    state = _myPosts!.posts;

    // _refreshController.refreshCompleted();
  }

  void _init() async {
    state = {};

    postsRepository = ref.watch(postsRepositoryProvider);
    getMyPostsInitial();
  }

  Future<void> _getMyPosts() async {
    _myPosts = await postsRepository.getMyPosts(start: _start, offset: _offset);
  }
}
