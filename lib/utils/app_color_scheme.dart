import 'package:flutter/material.dart';
import 'package:four_hours_client/utils/app_colors.dart';

ColorScheme lightColorScheme = ColorScheme(
  primary: CustomColors.light.gray900,
  secondary: CustomColors.light.gray700,
  background: CustomColors.white,
  surface: CustomColors.white,
  error: CustomColors.light.red,
  onPrimary: CustomColors.light.gray50,
  onSecondary: CustomColors.light.gray50,
  onBackground: CustomColors.light.gray900,
  onSurface: CustomColors.light.gray900,
  onError: CustomColors.light.gray50,
  brightness: Brightness.light,
);

ColorScheme darkColorsScheme = ColorScheme(
  primary: CustomColors.dark.gray900,
  secondary: CustomColors.dark.gray800,
  background: CustomColors.dark.gray50,
  surface: CustomColors.dark.gray100,
  error: CustomColors.dark.red,
  onPrimary: CustomColors.dark.gray50,
  onSecondary: CustomColors.dark.gray50,
  onBackground: CustomColors.dark.gray900,
  onSurface: CustomColors.dark.gray900,
  onError: CustomColors.dark.gray900,
  brightness: Brightness.dark,
);
