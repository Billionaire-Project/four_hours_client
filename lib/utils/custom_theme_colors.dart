import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/providers/theme_provider.dart';
import 'package:four_hours_client/utils/custom_colors.dart';

class CustomThemeColors {
  final bool isDarkMode;

  CustomThemeColors(this.isDarkMode);

  Color get primary =>
      isDarkMode ? CustomColors.dark.gray900 : CustomColors.light.gray900;
  Color get onPrimary =>
      isDarkMode ? CustomColors.dark.gray50 : CustomColors.light.gray50;

  Color get secondary =>
      isDarkMode ? CustomColors.dark.gray800 : CustomColors.light.gray700;
  Color get onSecondary =>
      isDarkMode ? CustomColors.dark.gray50 : CustomColors.light.gray50;

  Color get background => isDarkMode ? CustomColors.black : CustomColors.white;
  Color get onBackground =>
      isDarkMode ? CustomColors.dark.gray900 : CustomColors.light.gray900;
  Color get backgroundElevated =>
      isDarkMode ? CustomColors.dark.gray50 : CustomColors.white;
  Color get backgroundLabel =>
      isDarkMode ? CustomColors.dark.gray100 : CustomColors.light.gray100;
  Color get backgroundSurface =>
      isDarkMode ? CustomColors.dark.gray50 : CustomColors.light.gray100;
  Color get backgroundPath =>
      isDarkMode ? CustomColors.dark.gray100 : CustomColors.light.gray200;
  Color get backgroundToggle =>
      isDarkMode ? CustomColors.dark.gray900 : CustomColors.white;

  Color get surface =>
      isDarkMode ? CustomColors.dark.gray100 : CustomColors.white;
  Color get onSurface =>
      isDarkMode ? CustomColors.dark.gray900 : CustomColors.light.gray900;

  Color get textPrimary =>
      isDarkMode ? CustomColors.dark.gray800 : CustomColors.light.gray900;
  Color get textSecondary =>
      isDarkMode ? CustomColors.dark.gray600 : CustomColors.light.gray600;
  Color get textDisabled =>
      isDarkMode ? CustomColors.dark.gray100 : CustomColors.light.gray400;
  Color get textInvert =>
      isDarkMode ? CustomColors.dark.gray50 : CustomColors.light.gray50;
  Color get textTertiary =>
      isDarkMode ? CustomColors.dark.gray300 : CustomColors.light.gray300;

  Color get buttonPrimary =>
      isDarkMode ? CustomColors.dark.gray900 : CustomColors.light.gray900;
  Color get buttonSecondary =>
      isDarkMode ? CustomColors.dark.gray600 : CustomColors.light.gray700;
  Color get buttonDisabled =>
      isDarkMode ? CustomColors.dark.gray100 : CustomColors.light.gray200;

  Color get strokeDivider =>
      isDarkMode ? CustomColors.dark.gray100 : CustomColors.light.gray200;
  Color get strokeBorder =>
      isDarkMode ? CustomColors.dark.gray100 : CustomColors.light.gray900;

  Color get red => isDarkMode ? CustomColors.dark.red : CustomColors.light.red;
  Color get blue =>
      isDarkMode ? CustomColors.dark.blue : CustomColors.light.blue;
  Color get orange =>
      isDarkMode ? CustomColors.dark.orange : CustomColors.light.orange;
}

final customThemeColorsProvider = Provider((ref) {
  bool isDarkMode = ref.watch(themeNotifierProvider);
  return CustomThemeColors(isDarkMode);
});
