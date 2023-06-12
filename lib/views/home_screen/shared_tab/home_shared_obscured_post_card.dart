import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/controller/post_card_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_shadow_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';

class HomeSharedObscuredPostCard extends ConsumerStatefulWidget {
  final PostModel post;
  final String labelText;
  const HomeSharedObscuredPostCard({
    Key? key,
    required this.post,
    required this.labelText,
  }) : super(key: key);

  @override
  ConsumerState<HomeSharedObscuredPostCard> createState() =>
      _HomeSharedObscuredPostCardState();
}

class _HomeSharedObscuredPostCardState
    extends ConsumerState<HomeSharedObscuredPostCard> {
  Size childSize = Size.zero;

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
            top: 8.0,
            right: 8.0,
            bottom: 8.0,
          ),
          constraints: const BoxConstraints(
            maxHeight: cardWithTwoDividersMaxHeight,
            minHeight: cardWithTwoDividersMinHeight,
          ),
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.white,
                Colors.white,
                Colors.white.withOpacity(0.8),
                Colors.white.withOpacity(0.6),
                Colors.white.withOpacity(0.4),
                Colors.white.withOpacity(0.2),
                Colors.white.withOpacity(0.0),
                Colors.transparent,
                Colors.transparent,
              ],
            ),
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
                    postNotifier.handlePressedMoreButton(
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
                          style: customTextStyle.bodySmall,
                        ),
                      ],
                    ),
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