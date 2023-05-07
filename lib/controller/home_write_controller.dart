import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_write_controller.g.dart';

@riverpod
class WriteController extends _$WriteController {
  late final PostsRepository postsRepository;

  @override
  List<PostModel> build() {
    _init();
    return state;
  }

  Future<void> _getMyPosts() async {
    state = await postsRepository.getMyPosts();
  }

  void _init() async {
    postsRepository = ref.watch(postsRepositoryProvider);
    //! StateError (Bad state: Tried to read the state of an uninitialized provider)
    state = [];
    await _getMyPosts();
  }
}
