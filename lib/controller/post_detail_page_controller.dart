import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_detail_page_controller.g.dart';

@riverpod
class PostDetailPageController extends _$PostDetailPageController {
  @override
  FutureOr<PostModel?> build() {
    return state.value;
  }

  Future<void> getPostById({required String postId}) async {
    final postsRepository = ref.watch(postsRepositoryProvider);
    final PostModel post = await postsRepository.getPostById(postId: postId);
    state = AsyncValue.data(post);
  }
}
