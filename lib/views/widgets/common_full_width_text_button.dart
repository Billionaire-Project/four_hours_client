import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';

class CommonFullWidthTextButton extends ConsumerWidget {
  final VoidCallback onPressed;
  final String text;
  const CommonFullWidthTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);
    final customTextStyle = ref.watch(customTextStyleProvider);

    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 48,
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          color: customThemeColors.primary,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            text,
            style: customTextStyle.titleMedium.copyWith(
              color: customThemeColors.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
