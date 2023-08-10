import 'package:four_hours_client/models/topic_model.dart';
import 'package:four_hours_client/repositories/resources_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'topic_controller.g.dart';

@riverpod
class TopicController extends _$TopicController {
  @override
  Future<TopicModel> build() {
    return getTopic();
  }

  Future<TopicModel> getTopic() async {
    final TopicModel topicModel =
        await ref.read(resourcesRepositoryProvider).getTopic();

    return topicModel;
  }
}
