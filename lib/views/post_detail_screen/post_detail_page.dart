import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/post_detail_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/post_detail_screen/post_detail_bottom.dart';

import 'package:four_hours_client/views/widgets/common_app_bar.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/common_title.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';

class PostDetailPage extends ConsumerStatefulWidget {
  final String postId;
  final PostModel post;
  final bool isNeedBottom;

  const PostDetailPage({
    Key? key,
    required this.postId,
    required this.post,
    required this.isNeedBottom,
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
    final postDetail =
        ref.watch(postDetailControllerProvider(post: widget.post));
    final postDetailNotifier =
        ref.read(postDetailControllerProvider(post: widget.post).notifier);

    return MainWrapper(
      appBar: CommonAppBar(
        actions: [
          CommonIconButton(
            onTap: () {
              postDetailNotifier.handlePressedMoreButton(context);
            },
            icon: const Icon(
              CustomIcons.more_line,
            ),
          )
        ],
      ),
      child: Column(
        children: [
          postDetail.when(data: (postByController) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonRowWithDivider(
                      header: CommonTitle(
                        getPostElapsedTime(
                          date: postByController.updatedAt,
                        ),
                      ),
                    ),
                    const Gap(8),
                    Text(
                      postByController.content,
                      style: customTextStyle.bodySmall,
                    ),
                  ],
                ),
              ),
            );
          }, loading: () {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonRowWithDivider(
                      header: CommonTitle(
                        getPostElapsedTime(
                          date: widget.post.updatedAt,
                        ),
                      ),
                    ),
                    const Gap(8),
                    Text(
                      widget.post.content,
                      style: customTextStyle.bodySmall,
                    ),
                  ],
                ),
              ),
            );
          }, error: (error, stackTrace) {
            return Expanded(
              child: Center(
                child: Text('에러가 발생했습니다 $error'),
              ),
            );
          }),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         CommonRowWithDivider(
          //           header: CommonTitle(
          //               getPostElapsedTime(date: widget.post.updatedAt)),
          //         ),
          //         const Gap(8),
          //         Text(
          //           widget.post.content,
          //           style: customTextStyle.bodySmall,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          widget.isNeedBottom
              ? PostDetailBottom(post: widget.post)
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
