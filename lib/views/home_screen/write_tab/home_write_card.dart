import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_shadow_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/shared_detail_post_screen/shared_post_detail_page.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:four_hours_client/views/widgets/measure_size.dart';
import 'package:go_router/go_router.dart';

class HomeWriteCard extends ConsumerStatefulWidget {
  final PostModel post;
  final String labelText;
  const HomeWriteCard({
    Key? key,
    required this.post,
    required this.labelText,
  }) : super(key: key);

  @override
  ConsumerState<HomeWriteCard> createState() => _HomeWriteCardState();
}

class _HomeWriteCardState extends ConsumerState<HomeWriteCard> {
  Size childSize = Size.zero;

  @override
  Widget build(BuildContext context) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      child: MeasureSize(
        onChange: (size) {
          setState(() {
            childSize = size;
          });
        },
        child: InkWell(
          onTap: () {
            context.goNamed(
              SharedPostDetailPage.name,
              params: {
                'postId': widget.post.id.toString(),
              },
              extra: widget.post,
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
              maxHeight: cardWithOneDividerMaxHeight,
              minHeight: cardWithOneDividerMinHeight,
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
                      widget.labelText,
                      style: customTextStyle.montLabelSmall,
                    ),
                  ),
                  rightGap: 8,
                  tail: CommonIconButton(
                    icon: const Icon(
                      CustomIcons.more_line,
                    ),
                    onTap: () {
                      //TODO: 내 글 삭제
                      // ref
                      //     .read(homeSharedControllerProvider.notifier)
                      //     .handlePressedMoreButton(
                      //       context,
                      //       postId: widget.post.id,
                      //     );
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
                            style: customTextStyle.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
