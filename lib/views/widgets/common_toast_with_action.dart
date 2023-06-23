import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class CommonToastWithAction extends ConsumerWidget {
  final IconData iconData;
  final String text;
  final Widget action;
  const CommonToastWithAction({
    Key? key,
    required this.iconData,
    required this.text,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width - pagePadding * 2,
      decoration: BoxDecoration(
        color: customThemeColors.strokeBorder,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                iconData,
                color: customThemeColors.backgroundToggle,
                size: 20,
              ),
              const Gap(8),
              Text(
                text,
                style: customTextStyle.labelSmall.copyWith(
                  color: customThemeColors.backgroundToggle,
                ),
              ),
            ],
          ),
          action
        ],
      ),
    );
  }
}
