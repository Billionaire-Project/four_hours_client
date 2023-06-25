import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';

class CommonFullWidthTextButton extends ConsumerWidget {
  final bool isDestructiveAction;
  final bool isCancelingAction;
  final String text;
  final VoidCallback onPressed;
  final double height;

  const CommonFullWidthTextButton({
    Key? key,
    this.isDestructiveAction = false,
    this.isCancelingAction = false,
    this.height = 48,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);
    final customTextStyle = ref.watch(customTextStyleProvider);

    BoxDecoration boxDecoration = BoxDecoration(
      color: customThemeColors.buttonPrimary,
      borderRadius: BorderRadius.circular(4),
    );
    Color textColor = customThemeColors.onPrimary;

    if (isDestructiveAction) {
      boxDecoration = BoxDecoration(
        color: customThemeColors.red,
        borderRadius: BorderRadius.circular(4),
      );
      textColor = customThemeColors.textInvert;
    } else if (isCancelingAction) {
      boxDecoration = BoxDecoration(
        color: customThemeColors.buttonDisabled,
        borderRadius: BorderRadius.circular(4),
      );
      textColor = customThemeColors.buttonPrimary;
    } else {
      boxDecoration = BoxDecoration(
        color: customThemeColors.buttonPrimary,
        borderRadius: BorderRadius.circular(4),
      );
      textColor = customThemeColors.textInvert;
    }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        decoration: boxDecoration,
        child: Center(
          child: Text(
            text,
            style: customTextStyle.titleMedium.copyWith(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
