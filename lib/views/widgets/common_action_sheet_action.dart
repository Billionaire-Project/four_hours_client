import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class CommonActionSheetAction extends ConsumerWidget {
  final IconData iconData;
  final String text;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final bool isDestructiveAction;
  const CommonActionSheetAction({
    Key? key,
    required this.onPressed,
    required this.iconData,
    required this.text,
    this.color,
    this.backgroundColor,
    this.isDestructiveAction = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor ?? customThemeColors.backgroundElevated,
      ),
      child: CupertinoActionSheetAction(
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(
              iconData,
              size: 24,
              color: isDestructiveAction
                  ? customThemeColors.red
                  : color ?? customThemeColors.textPrimary,
            ),
            const Gap(8),
            Text(
              text,
              style: customTextStyle.titleMedium.copyWith(
                color: isDestructiveAction
                    ? customThemeColors.red
                    : color ?? customThemeColors.textPrimary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
