import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:four_hours_client/controller/home_write_controller.dart';
import 'package:four_hours_client/controller/receipt_controller.dart';
import 'package:four_hours_client/models/delete_reason_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_tab.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_post_controller.g.dart';

@riverpod
class DeletePostController extends _$DeletePostController {
  PostsRepository? postsRepository;
  @override
  Future<List<DeleteReasonModel>> build({
    required int postId,
    required int reasonId,
  }) {
    _init();
    _getDeleteReason();
    return _getDeleteReason();
  }

  void handlePressedDeleteButton(
    BuildContext context, {
    required bool isDetailPage,
  }) async {
    bool isDeleted = await _deletePost();

//* 코드 흐름상 여기선 post delete만 수행하고 context pop을 하여 이전화면에서 다른 로직을 처리하는 게 맞으나
//* HomeWriteTab에서 왔는지 WritePostDetailPage에서 왔는지에 따라 context pop을 다르게 처리해야 하기 때문에
//* 코드의 통일성을 위해 write list를 refresh하는 로직과 삭제되었다는 alert를 띄우는 로직을 여기서 처리하고 있음

    if (isDeleted) {
      await ref.read(homeWriteControllerProvider.notifier).getMyPostsInitial();
      await ref.read(receiptControllerProvider.notifier).getReceipt();

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
      await postsRepository!.deletePost(
        postId: postId,
        reasonId: reasonId,
      );

      return true;
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  void _init() {
    postsRepository = ref.read(postsRepositoryProvider);
  }

  Future<List<DeleteReasonModel>> _getDeleteReason() async {
    state = await AsyncValue.guard(postsRepository!.getDeleteReason);

    return state.value ?? [];
  }
}
