import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/common_text_button.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class SettingButton extends ConsumerWidget {
  final String text;
  final IconData iconData;
  final VoidCallback onPressed;
  const SettingButton({
    Key? key,
    required this.text,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);
    return CommonTextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 13,
        ),
        backgroundColor: customThemeColors.backgroundSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 20,
            color: customThemeColors.red,
          ),
          const Gap(6),
          Text(
            text,
            style: customTextStyle.titleMedium.copyWith(
              color: customThemeColors.red,
            ),
          ),
        ],
      ),
    );
  }
}
