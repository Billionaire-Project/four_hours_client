import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_colors.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class SettingTileWithChevron extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);
    final customTextStyle = ref.watch(customTextStyleProvider);

    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            iconData,
            size: 24,
            color: color ?? customThemeColors.textPrimary,
          ),
          const Gap(8),
          Text(
            text,
            style: customTextStyle.labelMedium.copyWith(
              color: color ?? customThemeColors.textPrimary,
            ),
          ),
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
