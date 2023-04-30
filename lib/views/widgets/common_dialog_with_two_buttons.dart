import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/widgets/common_text_button.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class CommonDialogWithTwoButtons extends ConsumerWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onPressedRightButton;
  final String rightButtonText;
  final String? subtitle;
  final VoidCallback? onPressedLeftButton;
  final String? leftButtonText;
  final bool isDestructiveAction;
  const CommonDialogWithTwoButtons({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onPressedRightButton,
    required this.rightButtonText,
    this.subtitle,
    this.onPressedLeftButton,
    this.leftButtonText,
    this.isDestructiveAction = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);
    final customTextStyle = ref.watch(customTextStyleProvider);

    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: customThemeColors.backgroundElevated,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: customThemeColors.textPrimary,
              size: 32.0,
            ),
            const Gap(8),
            Text(title, style: customTextStyle.headlineSmall),
            if (subtitle != null) ...[
              const Gap(4),
              Text(
                subtitle!,
                style: customTextStyle.bodyMedium.copyWith(
                  color: customThemeColors.textSecondary,
                ),
              ),
            ],
            const Gap(24),
            Row(
              children: [
                Expanded(
                  child: CommonTextButton(
                    onPressed: () {
                      onPressedLeftButton?.call();
                      closeRootNavigator(context);
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      backgroundColor: customThemeColors.buttonDisabled,
                      foregroundColor: customThemeColors.textPrimary,
                    ),
                    child: Text(
                      leftButtonText ?? '취소',
                      style: customTextStyle.titleMedium,
                    ),
                  ),
                ),
                const Gap(8),
                Expanded(
                  child: CommonTextButton(
                    onPressed: () {
                      onPressedRightButton.call();
                      closeRootNavigator(context);
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      backgroundColor: isDestructiveAction
                          ? customThemeColors.red
                          : customThemeColors.buttonPrimary,
                      foregroundColor: customThemeColors.backgroundToggle,
                    ),
                    child: Text(
                      rightButtonText,
                      style: customTextStyle.titleMedium
                          .copyWith(color: customThemeColors.backgroundToggle),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
