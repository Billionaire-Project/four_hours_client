import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/write_post_detail_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/functions.dart';

import 'package:four_hours_client/views/widgets/common_app_bar.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/common_title.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';

class WritePostDetailPage extends ConsumerStatefulWidget {
  final String postId;
  final PostModel post;
  const WritePostDetailPage({
    Key? key,
    required this.postId,
    required this.post,
  }) : super(key: key);
  static String path = 'write-post-detail/:postId';
  static String name = 'WritePostDetailPage';

  @override
  ConsumerState<WritePostDetailPage> createState() =>
      _WritePostDetailPageState();
}

class _WritePostDetailPageState extends ConsumerState<WritePostDetailPage> {
  @override
  Widget build(BuildContext context) {
    final customTextStyle = ref.watch(customTextStyleProvider);

    return MainWrapper(
      appBar: CommonAppBar(
        actions: [
          CommonIconButton(
            onTap: () {
              ref
                  .read(writePostDetailControllerProvider(widget.post).notifier)
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
                        getPostElapsedTime(date: widget.post.updatedAt)),
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
        ],
      ),
    );
  }
}
