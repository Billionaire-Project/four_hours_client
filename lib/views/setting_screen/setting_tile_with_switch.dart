import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/providers/theme_provider.dart';
import 'package:four_hours_client/utils/app_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class SettingTileWithSwitch extends ConsumerStatefulWidget {
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
  ConsumerState<SettingTileWithSwitch> createState() =>
      _SettingTileWithSwitchState();
}

class _SettingTileWithSwitchState extends ConsumerState<SettingTileWithSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          widget.iconData,
          size: 24,
          color: widget.color ?? CustomThemeColor(context).textPrimary,
        ),
        const Gap(8),
        Text(
          widget.text,
          style: CustomTextStyle(context).labelMedium.copyWith(
                color: widget.color ?? CustomThemeColor(context).textPrimary,
              ),
        ),
        const Spacer(),
        CupertinoSwitch(
          value: widget.value,
          onChanged: (value) {
            ref.read(themeNotifierProvider.notifier).changeTheme();
          },
          activeColor: CustomColors.light.orange,
          trackColor: CustomColors.light.gray200,
        ),
      ],
    );
  }
}
