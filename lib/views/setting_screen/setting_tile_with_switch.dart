import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class SettingTileWithSwitch extends ConsumerStatefulWidget {
  final IconData iconData;
  final Color? color;
  final String text;
  final bool value;
  final void Function(bool)? onChanged;

  const SettingTileWithSwitch({
    Key? key,
    required this.iconData,
    required this.text,
    required this.value,
    this.color,
    this.onChanged,
  }) : super(key: key);

  @override
  ConsumerState<SettingTileWithSwitch> createState() =>
      _SettingTileWithSwitchState();
}

class _SettingTileWithSwitchState extends ConsumerState<SettingTileWithSwitch> {
  @override
  Widget build(BuildContext context) {
    final customThemeColors = ref.watch(customThemeColorsProvider);
    final customTextStyle = ref.watch(customTextStyleProvider);

    return Row(
      children: [
        Icon(
          widget.iconData,
          size: 24,
          color: widget.color ?? customThemeColors.textPrimary,
        ),
        const Gap(8),
        Text(
          widget.text,
          style: customTextStyle.labelMedium.copyWith(
            color: widget.color ?? customThemeColors.textPrimary,
          ),
        ),
        const Spacer(),
        CupertinoSwitch(
          value: widget.value,
          onChanged: widget.onChanged,
          activeColor: CustomColors.light.orange,
          trackColor: CustomColors.light.gray200,
        ),
      ],
    );
  }
}
