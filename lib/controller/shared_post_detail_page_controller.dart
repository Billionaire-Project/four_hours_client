import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shared_post_detail_page_controller.g.dart';

class SharedPostDetailPageController {
  final int postId;
  final PostsRepository postsRepository;

  SharedPostDetailPageController({
    required this.postId,
    required this.postsRepository,
  }) {
    getPostById();
  }

  PostModel? _post;
  PostModel? get post => _post;

  void _int() {}

  Future<void> getPostById() async {
    _post = await postsRepository.getPostById(postId: postId.toString());
    print('jay ---  불리나???? {$_post}}');
  }

  // @override
  // AsyncValue<PostModel> build() {
  //   _init();
  //   return state;
  // }

  // Future<void> getPostById({required String id}) async {
  //   state = const AsyncValue.loading();
  //   state = await AsyncValue.guard(() async {
  //     return await postsRepository.getPostById(postId: id);
  //   });
  // }

  // String howMuchTimeLeft() {
  //   final DateTime date = DateTime.parse(state.updatedAt);
  //   final DateTime now = DateTime.now();
  //   final int difference = now.difference(date).inHours;

  //   String time;
  //   if (difference <= 0) {
  //     time = now.difference(date).inMinutes.toString();
  //     return '${time}minutes';
  //   } else {
  //     time = now.difference(now).inHours.toString();
  //     return '${time}hours';
  //   }
  // }

  // void _init() {
  //   postsRepository = ref.watch(postsRepositoryProvider);

  //   getPostById(id: postId);
  // }
}

@riverpod
SharedPostDetailPageController sharedPostDetailPageController(
  SharedPostDetailPageControllerRef ref, {
  required int postId,
}) {
  final postsRepository = ref.watch(postsRepositoryProvider);

  return SharedPostDetailPageController(
    postId: postId,
    postsRepository: postsRepository,
  );
}
