import 'package:flutter/material.dart';
import 'package:four_hours_client/utils/app_colors.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class SettingTileWithChevron extends StatelessWidget {
  final IconData iconData;
  final Color? color;
  final String text;
  final void Function()? onTap;

  const SettingTileWithChevron({
    Key? key,
    required this.iconData,
    required this.text,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            iconData,
            size: 24,
            color: color ?? CustomThemeColor(context).textPrimary,
          ),
          const Gap(8),
          Text(text,
              style: CustomTextStyle(context).labelMedium.copyWith(
                    color: color ?? CustomThemeColor(context).textPrimary,
                  )),
          const Spacer(),
          Icon(
            CustomIcons.chevron_right,
            size: 24,
            color: CustomColors.light.gray300,
          ),
        ],
      ),
    );
  }
}
