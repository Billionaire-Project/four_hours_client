import 'package:flutter/cupertino.dart';
import 'package:four_hours_client/utils/app_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class SettingTileWithSwitch extends StatelessWidget {
  final IconData iconData;
  final Color? color;
  final String text;
  final bool value;

  const SettingTileWithSwitch({
    Key? key,
    required this.iconData,
    required this.text,
    required this.value,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 24,
          color: color ?? CustomThemeColor(context).textPrimary,
        ),
        const Gap(8),
        Text(
          text,
          style: CustomTextStyle(context).labelMedium.copyWith(
                color: color ?? CustomThemeColor(context).textPrimary,
              ),
        ),
        const Spacer(),
        CupertinoSwitch(
          value: value,
          onChanged: (value) {},
          activeColor: CustomColors.light.orange,
          trackColor: CustomColors.light.gray200,
        ),
      ],
    );
  }
}
