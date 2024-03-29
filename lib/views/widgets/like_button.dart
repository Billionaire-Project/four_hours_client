import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/controller/like_controller.dart';
import 'package:four_hours_client/controller/liked_and_saved_controller.dart';
import 'package:four_hours_client/controller/saved_controller.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';

class LikeButton extends ConsumerStatefulWidget {
  final bool isLiked;
  final int postId;
  final bool isNeedLikedAndSaved;
  const LikeButton({
    Key? key,
    required this.isLiked,
    required this.postId,
    this.isNeedLikedAndSaved = false,
  }) : super(key: key);

  @override
  ConsumerState<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends ConsumerState<LikeButton>
    with TickerProviderStateMixin {
  Timer? _rightBoxHideTimer;
  bool isAnimating = false;
  bool isVeryFirstTime = true;

  late final AnimationController _likeAnimationController = AnimationController(
    duration: Duration.zero,
    vsync: this,
  );
  late final Animation<double> _likeAnimation = CurvedAnimation(
    parent: _likeAnimationController,
    curve: Curves.easeOutBack,
  );

  late final AnimationController _leftBoxAnimationController =
      AnimationController(
    duration: likeAnimationDuration,
    vsync: this,
  );

  late final Animation<double> _leftBoxAnimation = CurvedAnimation(
    parent: _leftBoxAnimationController,
    curve: Curves.easeOutBack,
  )..addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        _rightBoxHideTimer?.cancel();

        setState(() {
          isAnimating = true;
        });
      } else if (status == AnimationStatus.completed) {
        _rightBoxHideTimer =
            Timer(likeAndSavedHideDuration - likeAnimationDuration, () {
          _reverseRightBoxAnimation();
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          isAnimating = false;
        });
      }
    });

  void _forwardLikeAnimation() {
    _likeAnimationController.forward();
  }

  void _reverseLikeAnimation() {
    _likeAnimationController.reverse();
  }

  void _forwardRightBoxAnimation() {
    _leftBoxAnimationController.forward();
  }

  void _reverseRightBoxAnimation() {
    _leftBoxAnimationController.reverse();
  }

  void _resetLeftBoxAnimation() {
    _leftBoxAnimationController.reset();
  }

  @override
  void dispose() {
    _rightBoxHideTimer?.cancel();
    _likeAnimationController.dispose();
    _leftBoxAnimationController.dispose();
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
      _forwardLikeAnimation();
    } else {
      _reverseLikeAnimation();
    }

    bool shouldResetLikedAndSaved =
        ref.watch(likedAndSavedControllerProvider.notifier).shouldReset;

    if (shouldResetLikedAndSaved) {
      _resetLeftBoxAnimation();
    }

    return Row(
      children: [
        ScaleTransition(
          scale: _leftBoxAnimation,
          child: isAnimating
              ? Container(
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
                )
              : const SizedBox.shrink(),
        ),
        Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          child: InkWell(
            hoverColor: Colors.white.withOpacity(0.05),
            splashColor: Colors.white.withOpacity(0.15),
            customBorder: const CircleBorder(),
            onTap: () {
              if (_likeAnimationController.duration == Duration.zero) {
                _likeAnimationController.duration = likeAnimationDuration;
              }

              ref
                  .read(likedAndSavedControllerProvider.notifier)
                  .forwardLikedAndSavedAnimation();

              ref
                  .read(
                    likeControllerProvider(
                      isLiked: widget.isLiked,
                      postId: widget.postId,
                    ).notifier,
                  )
                  .handlePressedLikeButton(context);

              if (isLikedByController) {
                if (isAnimating) {
                  _reverseRightBoxAnimation();
                }
              } else {
                if (widget.isNeedLikedAndSaved) {
                  _forwardRightBoxAnimation();

                  ref.read(savedControllerProvider.notifier).showSaved();
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
                  ScaleTransition(
                    scale: _likeAnimation,
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
