import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/common_like_button.dart';

class PostDetailBottom extends ConsumerWidget {
  final PostModel post;

  const PostDetailBottom({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);

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
          DecoratedBox(
            decoration: BoxDecoration(
              color: customThemeColors.backgroundLabel,
              shape: BoxShape.circle,
            ),
            child: CommonLikeButton(
              isLiked: post.isLiked!,
              postId: post.id,
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
          style: customTextStyle.montHeadlineSmall.copyWith(
            fontFeatures: [const FontFeature.tabularFigures()],
          ),
        ),
      ),
    );
  }
}
