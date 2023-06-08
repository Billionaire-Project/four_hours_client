import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/like_controller.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';

class CommonLikeButton extends ConsumerWidget {
  final bool isLiked;
  final int postId;
  const CommonLikeButton({
    Key? key,
    required this.isLiked,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);

    bool isLikedByController = ref.watch(
      likeControllerProvider(
        isLiked: isLiked,
        postId: postId,
      ),
    );

    return CommonIconButton(
      onTap: () {
        ref
            .read(
              likeControllerProvider(
                isLiked: isLiked,
                postId: postId,
              ).notifier,
            )
            .handlePressedLikeButton();
      },
      icon: isLikedByController
          ? Icon(
              CustomIcons.heart_fill,
              color: customThemeColors.orange,
            )
          : const Icon(
              CustomIcons.heart_line,
            ),
    );
  }
}
