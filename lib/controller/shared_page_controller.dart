import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shared_page_controller.g.dart';

@Riverpod(keepAlive: true)
class SharedPageController extends _$SharedPageController {
  late final PostsRepository postsRepository;

  @override
  AsyncValue<List<PostModel>> build() {
    _init();
    return state;
  }

  Future<void> _getPosts() async {
    state = await AsyncValue.guard(() async {
      return await postsRepository.getPosts();
    });
  }

  void _init() {
    state = const AsyncValue.loading();

    postsRepository = ref.watch(postsRepositoryProvider);
    _getPosts();
  }

  void resetPosts() {
    state = const AsyncValue.data([]);
    _getPosts();
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
