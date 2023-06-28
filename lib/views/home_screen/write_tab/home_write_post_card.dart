import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/controller/home_write_post_card_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_shadow_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class HomeWritePostCard extends ConsumerStatefulWidget {
  final PostModel post;
  final String time;
  final String postingDate;

  const HomeWritePostCard({
    Key? key,
    required this.post,
    required this.time,
    required this.postingDate,
  }) : super(key: key);

  @override
  ConsumerState<HomeWritePostCard> createState() => _HomeWritePostCardState();
}

class _HomeWritePostCardState extends ConsumerState<HomeWritePostCard> {
  Size childSize = Size.zero;

  @override
  Widget build(BuildContext context) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);

    final writePostNotifier = ref
        .read(writePostCardControllerProvider(postId: widget.post.id).notifier);

    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      child: GestureDetector(
        onTap: () {
          writePostNotifier.handlePressedCard(
            context,
            post: widget.post,
            time: widget.time,
            postingDate: widget.postingDate,
          );
        },
        child: Container(
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 8.0,
            right: 8.0,
            bottom: 16.0,
          ),
          constraints: const BoxConstraints(
            maxHeight: cardWithOneDividerMaxHeight,
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
                    writePostNotifier.handlePressedMoreButton(
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
            ],
          ),
        ),
      ),
    );
  }
}
