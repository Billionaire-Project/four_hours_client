import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';

import 'package:four_hours_client/views/widgets/common_app_bar.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/common_wrapper.dart';

class PostDetailPage extends ConsumerWidget {
  final String postId;
  final PostModel post;
  final Widget child;
  final String time;
  final String? postingDate;
  final VoidCallback onTap;

  const PostDetailPage({
    Key? key,
    required this.postId,
    required this.post,
    required this.child,
    required this.time,
    this.postingDate,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return CommonWrapper(
      backgroundColor: customThemeColors.backgroundElevated,
      appBar: CommonAppBar(
        title: postingDate,
        backgroundColor: customThemeColors.backgroundElevated,
        actions: [
          CommonIconButton(
            onTap: onTap,
            icon: const Icon(
              CustomIcons.more_line,
            ),
          )
        ],
      ),
      child: child,
    );
  }
}
