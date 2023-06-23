import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/controller/like_controller.dart';
import 'package:four_hours_client/providers/saved_controller.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/utils/functions.dart';
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

class _CommonLikeButtonState extends ConsumerState<CommonLikeButton>
    with TickerProviderStateMixin {
  Timer? _timer;
  bool shouldShowLikedAndSaved = false;
  double scale = 0;

  @override
  void initState() {
    super.initState();
    if (widget.isFromLikedPost) {
      _upScale();
    }
  }

  void _showLikedAndSaved() {
    setState(() {
      shouldShowLikedAndSaved = true;
    });
    ref.read(savedControllerProvider.notifier).showSaved();
  }

  void _hideLikedAndSaved() {
    setState(() {
      shouldShowLikedAndSaved = false;
    });
  }

  void _upScale() {
    setState(() {
      scale = 1;
    });
  }

  void _downScale() {
    setState(() {
      scale = 0;
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

    if (isLikedByController) {
      _upScale();
    }

    return Row(
      children: [
        if (isLikedByController && shouldShowLikedAndSaved)
          AnimatedOpacity(
            duration: likeAnimationDuration,
            opacity: scale,
            child: Container(
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
          ),
        Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          child: InkWell(
            hoverColor: Colors.white.withOpacity(0.05),
            splashColor: Colors.white.withOpacity(0.15),
            customBorder: const CircleBorder(),
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
                _downScale();
                _hideLikedAndSaved();
                showCommonToastWithAction(
                  context,
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
                      _hideLikedAndSaved();
                    },
                  ),
                );
              } else {
                _upScale();
                if (!widget.isFromLikedPost) {
                  _timer?.cancel();
                  _showLikedAndSaved();
                  _timer = Timer(const Duration(seconds: 3), () {
                    _hideLikedAndSaved();
                  });
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Stack(
                children: [
                  const Icon(
                    CustomIcons.heart_line,
                  ),
                  AnimatedScale(
                    scale: scale,
                    curve: Curves.easeOutBack,
                    duration: likeAnimationDuration,
                    child: Icon(
                      CustomIcons.heart_fill,
                      color: customThemeColors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
