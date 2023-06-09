import 'package:dio/dio.dart';
import 'package:four_hours_client/models/my_posts_pagination_model.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/models/posts_pagination_model.dart';
import 'package:four_hours_client/models/receipt_model.dart';
import 'package:four_hours_client/repositories/base_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'posts_repository.g.dart';

class PostsRepository extends BaseRepository {
  Future<PostsPaginationModel> getPosts({
    required String start,
    required String offset,
  }) async {
    Response response =
        await dioClient.get('/posts/?start=$start&offset=$offset');

    return PostsPaginationModel.fromJson(response.data);
  }

  Future<PostModel> getPostById({required int postId}) async {
    Response response = await dioClient.get('/posts/$postId/');

    return PostModel.fromJson(response.data);
  }

  Future<MyPostsPaginationModel> getMyPosts({
    required String start,
    required String offset,
  }) async {
    Response response =
        await dioClient.get('/posts/my/?start=$start&offset=$offset');

    return MyPostsPaginationModel.fromJson(response.data);
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

  Future<PostsPaginationModel> getLikePosts({
    required String start,
    required String offset,
  }) async {
    Response response =
        await dioClient.get('/posts/likes/?start=$start&offset=$offset');

    return PostsPaginationModel.fromJson(response.data);
  }

  Future<void> reportPost({required int postId}) async {
    await dioClient.post('/posts/report/$postId/');
  }

  Future<void> deletePost({required int postId}) async {
    await dioClient.delete('/posts/$postId/');
  }

  Future<ReceiptModel> getReceipt() async {
    Response response = await dioClient.get('/posts/receipt/');

    return ReceiptModel.fromJson(response.data);
  }
}

@Riverpod(keepAlive: true)
PostsRepository postsRepository(PostsRepositoryRef ref) {
  return PostsRepository();
}
