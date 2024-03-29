import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class CommonToast extends ConsumerWidget {
  final IconData iconData;
  final String text;
  const CommonToast({Key? key, required this.iconData, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width - pagePadding * 2,
        height: 48,
        decoration: BoxDecoration(
          color: customThemeColors.buttonPrimary.withOpacity(0.8),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: customThemeColors.textInvert,
                size: 16,
              ),
              const Gap(8),
              Text(
                text,
                style: customTextStyle.labelSmall.copyWith(
                  color: customThemeColors.textInvert,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
