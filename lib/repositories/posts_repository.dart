import 'package:dio/dio.dart';
import 'package:four_hours_client/network/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'posts_repository.g.dart';

class PostsRepository {
  final DioClient dioClient;
  PostsRepository({required this.dioClient});

  Future<Response> getMyPosts() async {
    Response response = await dioClient.get('/posts/my/');

    return response;
  }
}

@riverpod
PostsRepository postsRepository(PostsRepositoryRef ref) {
  return PostsRepository(
    dioClient: ref.watch(dioClientProvider),
  );
}
