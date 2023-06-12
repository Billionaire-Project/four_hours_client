import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/home_write_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_tab.dart';
import 'package:go_router/go_router.dart';

class DeletePostController extends StateNotifier<PostModel?> {
  late final StateNotifierProviderRef _ref;
  late final PostsRepository _postsRepository;

  DeletePostController(
    StateNotifierProviderRef ref, {
    required int postId,
  }) : super(null) {
    _ref = ref;
    _postId = postId;
    _postsRepository = _ref.watch(postsRepositoryProvider);
  }

  int? _postId;

  void handlePressedDeleteButton(
    BuildContext context, {
    required bool isDetailPage,
  }) async {
    bool isDeleted = await _deletePost();

//* 코드 흐름상 여기선 post delete만 수행하고 context pop을 하여 이전화면에서 다른 로직을 처리하는 게 맞으나
//* HomeWriteTab에서 왔는지 WritePostDetailPage에서 왔는지에 따라 context pop을 다르게 처리해야 하기 때문에
//* 코드의 통일성을 위해 write list를 refresh하는 로직과 삭제되었다는 alert를 띄우는 로직을 여기서 처리하고 있음

    await _ref.read(homeWriteControllerProvider.notifier).getMyPostsInitial();

    if (isDeleted) {
      if (context.mounted) {
        if (isDetailPage) {
          context.go(HomeWriteTab.path);
        } else {
          context.pop();
        }
      }
      Future.delayed(
        const Duration(milliseconds: 100),
        () {
          showCommonAlert(
            iconData: CustomIcons.check_line,
            text: '삭제 되었어요!',
          );
        },
      );
    }
  }

  Future<bool> _deletePost() async {
    try {
      await _postsRepository.deletePost(postId: _postId!);

      return true;
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }
}

final deletePostControllerProvider = StateNotifierProvider.autoDispose
    .family<DeletePostController, PostModel?, int>(
  (ref, postId) => DeletePostController(ref, postId: postId),
);
