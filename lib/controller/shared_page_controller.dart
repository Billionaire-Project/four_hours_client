import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shared_page_controller.g.dart';

@Riverpod(keepAlive: true)
class SharedPageController extends _$SharedPageController {
  @override
  List<PostModel> build() {
    return [];
  }

  Future<List<PostModel>> getPosts() async {
    final postsRepository = ref.watch(postsRepositoryProvider);
    state = await postsRepository.getPosts();
    return await postsRepository.getPosts();
  }
}
