import 'package:flutter/material.dart';
import 'package:four_hours_client/utils/app_colors.dart';

class CustomThemeColor {
  BuildContext context;

  late final Brightness brightness;
  late final bool isDarkMode;
  CustomThemeColor(this.context) {
    brightness = Theme.of(context).brightness;
    isDarkMode = brightness == Brightness.dark;
  }

  Color get textPrimary =>
      isDarkMode ? CustomColors.dark.gray900 : CustomColors.light.gray900;
  Color get textSecondary =>
      isDarkMode ? CustomColors.dark.gray800 : CustomColors.light.gray600;
  Color get textDisabled =>
      isDarkMode ? CustomColors.dark.gray100 : CustomColors.light.gray400;

  Color get buttonPrimary =>
      isDarkMode ? CustomColors.dark.gray900 : CustomColors.light.gray900;
  Color get buttonSecondary =>
      isDarkMode ? CustomColors.dark.gray600 : CustomColors.light.gray700;
  Color get buttonDisabled =>
      isDarkMode ? CustomColors.dark.gray200 : CustomColors.light.gray200;
}
