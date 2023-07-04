import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/home_shared_post_detail_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/views/error_screen/error_page.dart';

import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/common_title.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:four_hours_client/views/widgets/post_detail_screen/post_detail_bottom.dart';
import 'package:four_hours_client/views/widgets/post_detail_screen/post_detail_page.dart';
import 'package:go_router/go_router.dart';

class SharedPostDetailPage extends ConsumerWidget {
  final String postId;
  final PostModel post;
  final String time;

  const SharedPostDetailPage({
    Key? key,
    required this.postId,
    required this.post,
    required this.time,
  }) : super(key: key);
  static String path = 'shared-post-detail/:postId';
  static String name = 'SharedPostDetailPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);

    final sharedPostDetail =
        ref.watch(sharedPostDetailControllerProvider(context, post: post));

    return PostDetailPage(
      postId: postId,
      post: post,
      time: time,
      onTap: () {
        ref
            .read(sharedPostDetailControllerProvider(context, post: post)
                .notifier)
            .handlePressedMoreButton();
      },
      child: Column(
        children: [
          sharedPostDetail.when(data: (postModel) {
            if (postModel == null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                bool canPop = context.canPop();

                if (canPop) {
                  context.pop(true);
                }
              });
              return const SizedBox.shrink();
            } else {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonRowWithDivider(
                          leading: CommonTitle(
                            time,
                          ),
                        ),
                        const Gap(8),
                        Text(
                          postModel.content,
                          style: customTextStyle.bodyMedium,
                        ),
                        const Gap(16),
                      ],
                    ),
                  ),
                ),
              );
            }
          }, loading: () {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonRowWithDivider(
                        leading: CommonTitle(
                          time,
                        ),
                      ),
                      const Gap(8),
                      Text(
                        post.content,
                        style: customTextStyle.bodyMedium,
                      ),
                      const Gap(16),
                    ],
                  ),
                ),
              ),
            );
          }, error: (error, _) {
            return ErrorPage(error: error);
          }),
          PostDetailBottom(
            post: post,
            isNeedTimer: true,
          )
        ],
      ),
    );
  }
}
