import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/controller/home_shared_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_shadow_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/shared_detail_post_screen/shared_post_detail_page.dart';
import 'package:four_hours_client/views/widgets/common_card_cover.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:go_router/go_router.dart';

class SharedPostCard extends ConsumerWidget {
  final PostModel post;
  final String labelText;
  const SharedPostCard({
    Key? key,
    required this.post,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);
    //TODO: isReported 필드에서 받아오기
    bool isReported = ref.watch(sharedPageReportControllerProvider);
//TODO: 신고된 포스트만 숨기기
    if (isReported) {
      return const CommonCardCover(
        iconData: CustomIcons.report_fill,
        title: '신고가 정상적으로 접수되었어요',
        subtitle: '해당 글은 숨긴처리 됐습니다',
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      child: InkWell(
        onTap: () {
          context.goNamed(
            SharedPostDetailPage.name,
            params: {
              'postId': post.id.toString(),
            },
            extra: post,
          );
        },
        child: Container(
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 8.0,
            right: 8.0,
            bottom: 8.0,
          ),
          constraints: const BoxConstraints(
            maxHeight: sharedPostCardMaxHeight,
            minHeight: sharedPostCardMinHeight,
          ),
          decoration: BoxDecoration(
            color: customThemeColors.background,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: CustomShadowColors.shadow3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonRowWithDivider(
                header: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 2.0,
                  ),
                  decoration: BoxDecoration(
                    color: customThemeColors.backgroundLabel,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    labelText,
                    style: customTextStyle.montLabelSmall,
                  ),
                ),
                rightGap: 8,
                tail: CommonIconButton(
                  icon: const Icon(
                    CustomIcons.more_line,
                  ),
                  onTap: () {
                    ref
                        .read(homeSharedControllerProvider.notifier)
                        .handlePressedMoreButton(context);
                  },
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 6,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: post.content,
                          style: customTextStyle.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(8),
              CommonRowWithDivider(
                tail: CommonIconButton(
                  onTap: () {
                    ref
                        .read(homeSharedControllerProvider.notifier)
                        .handlePressedLikeButton(post.id);
                  },
                  icon: post.isLiked!
                      ? Icon(
                          CustomIcons.heart_fill,
                          color: customThemeColors.orange,
                        )
                      : const Icon(
                          CustomIcons.heart_line,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
