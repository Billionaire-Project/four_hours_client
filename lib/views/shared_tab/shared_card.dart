import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_shadow_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class SharedCard extends ConsumerWidget {
  final String labelText;
  final String content;
  const SharedCard({
    Key? key,
    required this.labelText,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return Container(
      padding:
          const EdgeInsets.only(top: 8.0, left: 16.0, right: 8.0, bottom: 8.0),
      constraints: const BoxConstraints(maxHeight: 232),
      decoration: BoxDecoration(
        color: customThemeColors.background,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: CustomShadowColors.shadow3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonRowWithDivider(
            header: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
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
            tail: const CommonIconButton(
              icon: Icon(
                CustomIcons.more_line,
              ),
            ),
          ),
          const Gap(8),
          Expanded(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              maxLines: 6,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: content,
                    style: customTextStyle.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          const CommonRowWithDivider(
            tail: CommonIconButton(
                icon: Icon(
              CustomIcons.heart_line,
            )),
          )
        ],
      ),
    );
  }
}
