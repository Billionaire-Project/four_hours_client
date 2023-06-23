import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/utils/custom_shadow_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class CommonCardCover extends ConsumerWidget {
  final double? height;
  final IconData iconData;
  final String title;
  final String subtitle;

  const CommonCardCover({
    Key? key,
    this.height = cardWithTwoDividersMaxHeight,
    required this.iconData,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: customThemeColors.backgroundSurface,
        border: Border.all(
          width: 2,
          color: customThemeColors.strokeBorder,
        ),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: CustomShadowColors.shadow3,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 32,
            ),
            const Gap(8),
            Text(
              title,
              style: customTextStyle.titleLarge,
              textAlign: TextAlign.center,
            ),
            const Gap(4),
            Text(
              subtitle,
              style: customTextStyle.bodyMedium.copyWith(
                color: customThemeColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
