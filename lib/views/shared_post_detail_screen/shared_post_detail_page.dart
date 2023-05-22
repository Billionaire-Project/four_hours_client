import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/shared_post_detail_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/shared_post_detail_screen/shared_post_detail_bottom.dart';

import 'package:four_hours_client/views/widgets/common_app_bar.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/common_title.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';

class SharedPostDetailPage extends ConsumerStatefulWidget {
  final String postId;
  final PostModel post;
  const SharedPostDetailPage({
    Key? key,
    required this.postId,
    required this.post,
  }) : super(key: key);
  static String path = 'post-detail/:postId';
  static String name = 'SharedPostDetailPage';

  @override
  ConsumerState<SharedPostDetailPage> createState() =>
      _SharedPostDetailPageState();
}

class _SharedPostDetailPageState extends ConsumerState<SharedPostDetailPage> {
  @override
  Widget build(BuildContext context) {
    final customTextStyle = ref.watch(customTextStyleProvider);

    return MainWrapper(
      appBar: CommonAppBar(
        actions: [
          CommonIconButton(
            onTap: () {
              ref
                  .read(
                      sharedPostDetailControllerProvider(widget.post).notifier)
                  .handlePressedMoreButton(context);
            },
            icon: const Icon(
              CustomIcons.more_line,
            ),
          )
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonRowWithDivider(
                    header: CommonTitle(
                        getPostElapsedTime(date: widget.post.createdAt)),
                  ),
                  const Gap(8),
                  Text(
                    widget.post.content,
                    style: customTextStyle.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          SharedPostDetailBottom(post: widget.post),
        ],
      ),
    );
  }
}
