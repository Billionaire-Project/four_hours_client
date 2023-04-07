import 'package:flutter/material.dart';
import 'package:four_hours_client/utils/app_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class CommonDialogWithTwoButtons extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subtitle;
  final VoidCallback onPressedRightButton;
  final String rightButtonText;
  final VoidCallback? onPressedLeftButton;
  final String? leftButtonText;
  const CommonDialogWithTwoButtons(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.subtitle,
      required this.onPressedRightButton,
      required this.rightButtonText,
      this.onPressedLeftButton,
      this.leftButtonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: CustomThemeColor(context).backgroundElevated,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconData,
                color: CustomThemeColor(context).textPrimary, size: 32.0),
            const Gap(8),
            Text(title, style: CustomTextStyle(context).headlineSmall),
            const Gap(4),
            Text(subtitle,
                style: CustomTextStyle(context)
                    .bodyMedium
                    .copyWith(color: CustomThemeColor(context).textSecondary)),
            const Gap(24),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      onPressedLeftButton ?? closeRootNavigator(context);
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: CustomThemeColor(context).textPrimary,
                        side: BorderSide(
                            width: 1,
                            color: CustomThemeColor(context).buttonPrimary)),
                    child: Text(
                      leftButtonText ?? '취소',
                      style: CustomTextStyle(context).titleMedium,
                    ),
                  ),
                ),
                const Gap(8),
                Expanded(
                  child: TextButton(
                    onPressed: onPressedRightButton,
                    style: TextButton.styleFrom(
                      backgroundColor: CustomThemeColor(context).red,
                      foregroundColor: CustomThemeColor(context).textPrimary,
                    ),
                    child: Text(
                      rightButtonText,
                      style: CustomTextStyle(context)
                          .titleMedium
                          .copyWith(color: CustomColors.light.gray50),
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
