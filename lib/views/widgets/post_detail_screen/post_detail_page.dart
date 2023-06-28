import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/post_detail_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';

import 'package:four_hours_client/views/widgets/common_app_bar.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/common_wrapper.dart';

class PostDetailPage extends ConsumerStatefulWidget {
  final String postId;
  final PostModel post;
  final Widget child;
  final String time;
  final String? postingDate;

  const PostDetailPage({
    Key? key,
    required this.postId,
    required this.post,
    required this.child,
    required this.time,
    this.postingDate,
  }) : super(key: key);
  static String path = '/post-detail/:postId';
  static String name = 'PostDetailPage';

  @override
  ConsumerState<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends ConsumerState<PostDetailPage> {
  @override
  Widget build(BuildContext context) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);

    final postDetail =
        ref.watch(postDetailControllerProvider(context, post: widget.post));
    final postDetailNotifier = ref.read(
        postDetailControllerProvider(context, post: widget.post).notifier);

    return CommonWrapper(
      backgroundColor: customThemeColors.backgroundElevated,
      appBar: CommonAppBar(
        title: widget.postingDate,
        backgroundColor: customThemeColors.backgroundElevated,
        actions: [
          CommonIconButton(
            onTap: () {
              postDetailNotifier.handlePressedMoreButton(
                context,
                isFromMyPost: true,
              );
            },
            icon: const Icon(
              CustomIcons.more_line,
            ),
          )
        ],
      ),
      child: widget.child,
    );
  }
}
