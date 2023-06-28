import 'package:dio/dio.dart';
import 'package:four_hours_client/models/topic_model.dart';
import 'package:four_hours_client/repositories/base_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'resources_repository.g.dart';

class ResourcesRepository extends BaseRepository {
  Future<TopicModel> getTopic() async {
    Response response = await dioClient.get('/resources/topic/');

    return TopicModel.fromJson(response.data);
  }
}

@Riverpod(keepAlive: true)
ResourcesRepository resourcesRepository(ResourcesRepositoryRef ref) {
  return ResourcesRepository();
}
