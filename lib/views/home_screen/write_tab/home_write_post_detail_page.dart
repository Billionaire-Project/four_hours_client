import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/home_write_post_detail_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/error_screen/error_page.dart';
import 'package:four_hours_client/views/widgets/common_app_bar.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/common_wrapper.dart';

import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/common_title.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:go_router/go_router.dart';

class WritePostDetailPage extends ConsumerWidget {
  final String postId;
  final PostModel post;
  final String time;
  final String postingDate;

  const WritePostDetailPage({
    Key? key,
    required this.postId,
    required this.post,
    required this.time,
    required this.postingDate,
  }) : super(key: key);
  static String path = 'write-post-detail/:postId';
  static String name = 'WritePostDetailPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);

    final writePostDetail =
        ref.watch(writePostDetailControllerProvider(context, post: post));

    return CommonWrapper(
      backgroundColor: customThemeColors.backgroundElevated,
      appBar: CommonAppBar(
        title: postingDate.replaceAll('-', '.'),
        backgroundColor: customThemeColors.backgroundElevated,
        actions: [
          CommonIconButton(
            onTap: () {
              ref
                  .read(writePostDetailControllerProvider(context, post: post)
                      .notifier)
                  .handlePressedMoreButton();
            },
            icon: const Icon(
              CustomIcons.more_line,
            ),
          )
        ],
      ),
      child: Column(
        children: [
          writePostDetail.when(data: (postModel) {
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
        ],
      ),
    );
  }
}
