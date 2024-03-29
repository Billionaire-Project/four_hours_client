import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/controller/home_shared_post_card_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_shadow_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/common_card_cover.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/like_button.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:four_hours_client/views/widgets/measure_size.dart';

class HomeSharedPostCard extends ConsumerStatefulWidget {
  final PostModel post;
  final String time;
  const HomeSharedPostCard({
    Key? key,
    required this.post,
    required this.time,
  }) : super(key: key);

  @override
  ConsumerState<HomeSharedPostCard> createState() => _HomeSharedPostCardState();
}

class _HomeSharedPostCardState extends ConsumerState<HomeSharedPostCard> {
  Size childSize = Size.zero;

  @override
  Widget build(BuildContext context) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);

    final sharedPostNotifier = ref.read(
        sharedPostCardControllerProvider(postId: widget.post.id).notifier);

    bool isReported = widget.post.isReported!;
    if (isReported) {
      return Padding(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
        child: CommonCardCover(
          height: childSize.height,
          iconData: CustomIcons.report_fill,
          title: '신고가 정상적으로 접수되었어요',
          subtitle: '해당 글은 숨김처리 됐습니다',
        ),
      );
    }

    {
      return Padding(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
        child: MeasureSize(
          onChange: (size) {
            if (context.mounted) {
              setState(() {
                childSize = size;
              });
            }
          },
          child: GestureDetector(
            onTap: () {
              sharedPostNotifier.handlePressedCard(
                context,
                post: widget.post,
                time: widget.time,
                postingDate: '',
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
                maxHeight: cardWithTwoDividersMaxHeight,
              ),
              decoration: BoxDecoration(
                color: customThemeColors.backgroundElevated,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: CustomShadowColors.shadow3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonRowWithDivider(
                    leading: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 2.0,
                      ),
                      decoration: BoxDecoration(
                        color: customThemeColors.backgroundLabel,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        widget.time,
                        style: customTextStyle.montLabelSmall,
                      ),
                    ),
                    rightGap: 8,
                    trailing: CommonIconButton(
                      icon: const Icon(
                        CustomIcons.more_line,
                      ),
                      onTap: () {
                        sharedPostNotifier.handlePressedMoreButton(
                          context,
                          post: widget.post,
                        );
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
                              text: widget.post.content,
                              style: customTextStyle.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Gap(8),
                  CommonRowWithDivider(
                    rightGap: 8,
                    trailing: LikeButton(
                      isLiked: widget.post.isLiked!,
                      postId: widget.post.id,
                      isNeedLikedAndSaved: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
