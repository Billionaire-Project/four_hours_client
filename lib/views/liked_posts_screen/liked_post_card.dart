import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/controller/post_card_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_shadow_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/common_like_button.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class LikedPostCard extends ConsumerStatefulWidget {
  final PostModel post;
  final String labelText;
  const LikedPostCard({
    Key? key,
    required this.post,
    required this.labelText,
  }) : super(key: key);

  @override
  ConsumerState<LikedPostCard> createState() => _LikedPostCardState();
}

class _LikedPostCardState extends ConsumerState<LikedPostCard> {
  @override
  Widget build(BuildContext context) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);

    final postNotifier =
        ref.read(postCardControllerProvider(postId: widget.post.id).notifier);

    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      child: InkWell(
        onTap: () {
          postNotifier.handlePressedCard(
            context,
            post: widget.post,
          );
        },
        child: Container(
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 16.0,
            //* common icon buttons has 8.0 padding
            right: 8.0,
            bottom: 8.0,
          ),
          constraints: const BoxConstraints(
            maxHeight: cardWithTwoDividersMaxHeight,
            minHeight: cardWithTwoDividersMinHeight,
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
                    widget.labelText,
                    style: customTextStyle.montLabelSmall,
                  ),
                ),
                rightGap: 8,
                trailing: const SizedBox(width: 8),
              ),
              const Gap(8),
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
              CommonRowWithDivider(
                rightGap: 8,
                trailing: CommonLikeButton(
                  isLiked: widget.post.isLiked!,
                  postId: widget.post.id,
                  isFromLikedPost: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
