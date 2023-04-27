import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/repositories/base_repository.dart';

class PostRepository extends BaseRepository {
  Future<Response> getMyPosts() async {
    Response response = await dioClient.get('/api/v1/posts/my/');
    return response;
  }
}

final postRepositoryProvider =
    Provider<PostRepository>((ref) => PostRepository());
