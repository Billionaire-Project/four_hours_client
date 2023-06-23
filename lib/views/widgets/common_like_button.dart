import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:four_hours_client/controller/like_controller.dart';
import 'package:four_hours_client/providers/saved_controller.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/common_text_button.dart';

class CommonLikeButton extends ConsumerStatefulWidget {
  final bool isLiked;
  final int postId;
  final bool isFromLikedPost;
  const CommonLikeButton({
    Key? key,
    required this.isLiked,
    required this.postId,
    this.isFromLikedPost = false,
  }) : super(key: key);

  @override
  ConsumerState<CommonLikeButton> createState() => _CommonLikeButtonState();
}

class _CommonLikeButtonState extends ConsumerState<CommonLikeButton> {
  Timer? _timer;
  bool isShown = false;

  void appearLikedAndSaved() {
    setState(() {
      isShown = true;
    });
    ref.read(savedControllerProvider.notifier).appearSaved();
  }

  void disappearLikedAndSaved() {
    setState(() {
      isShown = false;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);

    bool isLikedByController = ref.watch(
      likeControllerProvider(
        isLiked: widget.isLiked,
        postId: widget.postId,
      ),
    );

    return Row(
      children: [
        if (isLikedByController && isShown)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 2.0,
            ),
            decoration: BoxDecoration(
              color: customThemeColors.orange,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              'Liked & Saved',
              style: customTextStyle.montLabelSmall.copyWith(
                color: customThemeColors.backgroundToggle,
              ),
            ),
          ),
        CommonIconButton(
          onTap: () {
            ref
                .read(
                  likeControllerProvider(
                    isLiked: widget.isLiked,
                    postId: widget.postId,
                  ).notifier,
                )
                .handlePressedLikeButton();
            if (isLikedByController) {
              disappearLikedAndSaved();
              showCommonToastWithAction(
                context,
                bottom: widget.isFromLikedPost ? 40 : 0,
                iconData: CustomIcons.heart_line,
                text: '해당 글이 좋아요 해제되었어요',
                action: CommonTextButton(
                  child: Text(
                    '실행 취소',
                    style: customTextStyle.titleMedium.copyWith(
                      color: customThemeColors.orange,
                    ),
                  ),
                  onPressed: () {
                    FToast().removeCustomToast();
                    ref
                        .read(
                          likeControllerProvider(
                            isLiked: widget.isLiked,
                            postId: widget.postId,
                          ).notifier,
                        )
                        .handlePressedLikeButton();
                    disappearLikedAndSaved();
                  },
                ),
              );
            } else {
              if (!widget.isFromLikedPost) {
                _timer?.cancel();
                appearLikedAndSaved();
                _timer = Timer(const Duration(seconds: 3), () {
                  disappearLikedAndSaved();
                });
              }
            }
          },
          icon: isLikedByController
              ? Icon(
                  CustomIcons.heart_fill,
                  color: customThemeColors.orange,
                )
              : const Icon(
                  CustomIcons.heart_line,
                ),
        ),
      ],
    );
  }
}
