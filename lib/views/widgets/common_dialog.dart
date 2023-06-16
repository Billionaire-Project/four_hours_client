import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/widgets/common_full_width_text_button.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class CommonDialog extends ConsumerWidget {
  final IconData iconData;
  final String title;
  final VoidCallback? onPressedButton;
  final String? buttonText;
  final String? subtitle;

  const CommonDialog({
    Key? key,
    required this.iconData,
    required this.title,
    this.buttonText,
    this.onPressedButton,
    this.subtitle,
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
            CommonFullWidthTextButton(
              text: buttonText ?? '확인',
              onPressed: () {
                onPressedButton?.call();
                closeRootNavigator();
              },
            )
          ],
        ),
      ),
    );
  }
}
