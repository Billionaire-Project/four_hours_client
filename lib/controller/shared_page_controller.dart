import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shared_page_controller.g.dart';

@Riverpod(keepAlive: true)
class SharedPageController extends _$SharedPageController {
  late final PostsRepository postsRepository;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;
  @override
  AsyncValue<List<PostModel>> build() {
    _init();
    return state;
  }

  Future<void> getPosts() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      return await postsRepository.getPosts();
    });
  }

  void refreshSharedList() async {
    state = await AsyncValue.guard(() async {
      return await postsRepository.getPosts();
    });
    _refreshController.refreshCompleted();
  }

  void _init() {
    postsRepository = ref.watch(postsRepositoryProvider);
    getPosts();
  }
}

@riverpod
class SharedPageReportController extends _$SharedPageReportController {
  @override
  bool build() {
    return false;
  }

  void reportPost() {
    state = true;
  }
}
