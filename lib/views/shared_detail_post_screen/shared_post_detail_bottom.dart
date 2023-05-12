import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/post_like_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';

class SharedPostDetailBottom extends ConsumerWidget {
  final PostModel post;

  const SharedPostDetailBottom({Key? key, required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);
    bool isLiked = ref.watch(
      postLikeControllerProvider(
        PostLikeControllerParameters(
          isLiked: post.isLiked!,
          postId: post.id,
        ),
      ),
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: customThemeColors.strokeDivider,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _Timer(post: post),
          _PostDetailAction(
            onTap: ref
                .read(postLikeControllerProvider(
                  PostLikeControllerParameters(
                    isLiked: post.isLiked!,
                    postId: post.id,
                  ),
                ).notifier)
                .handlePressedLikeButton,
            icon: isLiked
                ? Icon(
                    CustomIcons.heart_fill,
                    color: customThemeColors.orange,
                  )
                : const Icon(
                    CustomIcons.heart_line,
                  ),
          ),
        ],
      ),
    );
  }
}

class _Timer extends ConsumerStatefulWidget {
  final PostModel post;
  const _Timer({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  ConsumerState<_Timer> createState() => _TimerState();
}

class _TimerState extends ConsumerState<_Timer> {
  Duration _duration = const Duration(hours: 24, minutes: 0, seconds: 0);
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    final DateTime updatedAt = DateTime.parse(widget.post.updatedAt);
    final DateTime now = DateTime.now();
    final diff = now.difference(updatedAt);

    _duration = _duration - diff;

    _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
  }

  void _updateTimer(Timer timer) {
    setState(() {
      _duration = _duration - const Duration(seconds: 1);
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

    String hours = _duration.inHours.toString().padLeft(2, '0');
    String minutes = (_duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (_duration.inSeconds % 60).toString().padLeft(2, '0');

    return Container(
      decoration: BoxDecoration(
        color: customThemeColors.backgroundLabel,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Text(
          '$hours:$minutes:$seconds',
          style: customTextStyle.montHeadlineSmall,
        ),
      ),
    );
  }
}

class _PostDetailAction extends ConsumerWidget {
  final Icon icon;
  final VoidCallback onTap;
  const _PostDetailAction({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: customThemeColors.backgroundLabel,
        shape: BoxShape.circle,
      ),
      child: CommonIconButton(
        onTap: onTap,
        icon: icon,
      ),
    );
  }
}
