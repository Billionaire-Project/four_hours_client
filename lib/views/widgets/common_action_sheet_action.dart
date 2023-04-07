import 'package:flutter/cupertino.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class CommonActionSheetAction extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  const CommonActionSheetAction({
    Key? key,
    required this.onPressed,
    required this.iconData,
    required this.text,
    this.color,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor ?? CustomThemeColor(context).background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: CupertinoActionSheetAction(
          onPressed: onPressed,
          child: Row(
            children: [
              Icon(
                iconData,
                size: 24,
                color: color ?? CustomThemeColor(context).textPrimary,
              ),
              const Gap(8),
              Text(
                text,
                style: CustomTextStyle(context).titleMedium.copyWith(
                    color: color ?? CustomThemeColor(context).textPrimary),
              )
            ],
          )),
    );
  }
}
