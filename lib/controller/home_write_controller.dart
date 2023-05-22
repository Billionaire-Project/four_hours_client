import 'package:four_hours_client/models/my_posts_model.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_write_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeWriteController extends _$HomeWriteController {
  late final PostsRepository postsRepository;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;

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

  Future<void> getMoreMyPosts() async {
    //TODO: 내 포스트 리스트를 날짜별로 내려주는데 이걸 자연스럽게 페이지네이션하도록 구현이 필요함
    await _getMyPosts();

    if (_myPosts!.next == null) {
      _refreshController.loadComplete();
      return;
    }
    final newDateList = _myPosts!.posts.keys.map((e) => e).toList();

    for (int i = 0; i < newDateList.length; i++) {
      if (_dateList!.contains(newDateList[i])) {
        print('jay --- contain new ${newDateList[i]}');
        state[newDateList[i]] = [
          ...state[newDateList[i]]!,
          ..._myPosts!.posts[newDateList[i]]!
        ];

        // state = {...state};
        print('jay --- state[newDateList[i]] ${state[newDateList[i]]!.length}');
      } else {
        print('jay --- not contain new ${newDateList[i]}');
        // print('jay --- state[newDateList[i]] ${state[newDateList[i - 1]]}');

        _dateList!.add(newDateList[i]);
        print('jay --- state $state');
        // state[newDateList[i]] = _myPosts!.posts[newDateList[i]]!;
        state = {...state, ..._myPosts!.posts};
      }
    }

    _start = _myPosts!.next!;
    // _dateList = [..._dateList!, ..._myPosts!.posts.keys.map((e) => e).toList()];
    // _dateList = _dateList!.toSet().toList();
    state = {...state};
    print('jay --- durldhsiu');
    _refreshController.loadComplete();
  }

  Future<void> refreshWriteList() async {
    _start = '0';
    _offset = '10';

    await _getMyPosts();

    state = _myPosts!.posts;
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
