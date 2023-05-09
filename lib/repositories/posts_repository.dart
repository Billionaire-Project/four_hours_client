import 'package:dio/dio.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/models/posts_model.dart';
import 'package:four_hours_client/repositories/base_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'posts_repository.g.dart';

class PostsRepository extends BaseRepository {
  Future<PostsModel> getPosts({
    required String start,
    required String offset,
  }) async {
    Response response =
        await dioClient.get('/posts/?start=$start&offset=$offset');

    return PostsModel.fromJson(response.data);
  }

  Future<PostModel> getPostById({required int postId}) async {
    Response response = await dioClient.get('/posts/$postId');

    return PostModel.fromJson(response.data);
  }

  Future<List<PostModel>> getMyPosts() async {
    Response response = await dioClient.get('/posts/my/');

    return (response.data['posts'] as List<dynamic>)
        .map((e) => PostModel.fromJson(e))
        .toList();
  }

  Future<Response> submitPosts({
    required int userId,
    required String content,
  }) async {
    Map data = {
      'user': userId,
      'content': content,
    };

    Response response = await dioClient.post('/posts/', data: data);

    return response;
  }

  Future<bool> likePost({required int postId}) async {
    Response response = await dioClient.post('/posts/like/$postId/');

    return response.data['is_liked'];
  }

  Future<PostsModel> getLikePosts({
    required String start,
    required String offset,
  }) async {
    Response response =
        await dioClient.get('/posts/likes/?start=$start&offset=$offset');

    return PostsModel.fromJson(response.data);
  }

  Future<Response> reportPost({required int postId}) async {
    Response response = await dioClient.post('/posts/report/$postId/');

    return response;
  }
}

@Riverpod(keepAlive: true)
PostsRepository postsRepository(PostsRepositoryRef ref) {
  return PostsRepository();
}
