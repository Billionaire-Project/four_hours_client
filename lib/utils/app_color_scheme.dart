import 'package:flutter/material.dart';
import 'package:four_hours_client/utils/app_colors.dart';

const ColorScheme lightColorScheme = ColorScheme(
  primary: AppLightColors.gray900,
  secondary: AppLightColors.gray700,
  background: AppLightColors.white,
  surface: AppLightColors.white,
  error: AppLightColors.red,
  onPrimary: AppLightColors.gray50,
  onSecondary: AppLightColors.gray50,
  onBackground: AppLightColors.gray900,
  onSurface: AppLightColors.gray900,
  onError: AppLightColors.gray50,
  brightness: Brightness.light,
);

const ColorScheme darkColorsScheme = ColorScheme(
  primary: AppDarkColors.gray900,
  secondary: AppDarkColors.gray800,
  background: AppDarkColors.gray50,
  surface: AppDarkColors.gray100,
  error: AppDarkColors.red,
  onPrimary: AppDarkColors.gray50,
  onSecondary: AppDarkColors.gray50,
  onBackground: AppDarkColors.gray900,
  onSurface: AppDarkColors.gray900,
  onError: AppDarkColors.gray900,
  brightness: Brightness.light,
);
