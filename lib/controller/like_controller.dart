import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:four_hours_client/controller/home_shared_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/widgets/common_text_button.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'like_controller.g.dart';

@riverpod
class LikeController extends _$LikeController {
  @override
  bool build({
    required bool isLiked,
    required int postId,
  }) {
    state = isLiked;
    return state;
  }

  void handlePressedLikeButton(BuildContext context) async {
    state = !state;
    state = await _likePost();

    if (!state) {
      final customTextStyle = ref.watch(customTextStyleProvider);
      final customThemeColors = ref.watch(customThemeColorsProvider);

      if (context.mounted) {
        showCommonToastWithAction(
          context,
          iconData: CustomIcons.heart_line,
          text: '해당 글이 좋아요 해제되었어요',
          action: CommonTextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
            ),
            onPressed: handlePressedCancel,
            child: Text(
              '실행 취소',
              style: customTextStyle.titleMedium.copyWith(
                color: customThemeColors.orange,
              ),
            ),
          ),
        );
      }
    }
  }

  Future<bool> _likePost() async {
    try {
      bool isLiked =
          await ref.read(postsRepositoryProvider).likePost(postId: postId);

      return isLiked;
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  void handlePressedCancel() async {
    FToast().removeCustomToast();

    if (state) return;

    state = true;
    state = await _likePost();

    final PostModel postModel =
        await ref.read(postsRepositoryProvider).getPostById(postId: postId);

    ref.read(homeSharedControllerProvider.notifier).replacePost(postModel);
  }
}
