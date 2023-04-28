import 'package:dio/dio.dart';
import 'package:four_hours_client/repositories/base_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'posts_repository.g.dart';

class PostsRepository extends BaseRepository {
  Future<Response> getMyPosts() async {
    Response response = await dioClient.get('/posts/my/');

    return response;
  }
}

@Riverpod(keepAlive: true)
PostsRepository postsRepository(PostsRepositoryRef ref) {
  return PostsRepository();
}
