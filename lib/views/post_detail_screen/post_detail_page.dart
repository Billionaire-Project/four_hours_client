import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/post_detail_page_controller.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/views/post_detail_screen/post_detail_bottom.dart';

import 'package:four_hours_client/views/widgets/common_app_bar.dart';
import 'package:four_hours_client/views/widgets/common_circular_progress_indicator.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/common_title.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';

class PostDetailPage extends ConsumerStatefulWidget {
  final String postId;
  const PostDetailPage({
    Key? key,
    required this.postId,
  }) : super(key: key);
  static String path = 'post-detail/:postId';
  static String name = 'PostDetailPage';

  @override
  ConsumerState<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends ConsumerState<PostDetailPage> {
  @override
  void initState() {
    super.initState();
    ref.read(postDetailPageControllerProvider.notifier).getPostById(
          postId: widget.postId,
        );
  }

  @override
  Widget build(BuildContext context) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final post = ref.watch(postDetailPageControllerProvider);

    return MainWrapper(
      appBar: const CommonAppBar(
        actions: [
          CommonIconButton(
            icon: Icon(
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
                  const CommonRowWithDivider(
                    header: CommonTitle('8hours'),
                  ),
                  const Gap(8),
                  post.when(
                    data: (post) {
                      if (post == null) {
                        return const Center(
                          child: CommonCircularProgressIndicator(
                              size: 32, strokeWidth: 2),
                        );
                      }
                      return Text(
                        post.content,
                        style: customTextStyle.bodySmall,
                      );
                    },
                    error: (error, _) => Text(
                      error.toString(),
                    ),
                    loading: () => const CommonCircularProgressIndicator(
                        size: 32, strokeWidth: 2),
                  ),
                ],
              ),
            ),
          ),
          const PostDetailBottom(),
        ],
      ),
    );
  }
}
