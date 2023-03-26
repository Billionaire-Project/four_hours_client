import 'package:flutter/material.dart';
import 'package:four_hours_client/constants/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      fontFamily: 'Pretendard, Mont',
      colorScheme: _lightColorScheme,
      buttonTheme: const ButtonThemeData(),
      iconTheme: const IconThemeData(
        color: Colors.white54,
      ),
      textTheme: _textTheme);

  static final ThemeData darkTheme = ThemeData(
      colorScheme: _darkColorsScheme,
      iconTheme: const IconThemeData(
        color: Colors.white54,
      ),
      textTheme: _textTheme);
}

const ColorScheme _lightColorScheme = ColorScheme(
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

const ColorScheme _darkColorsScheme = ColorScheme(
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

const TextTheme _textTheme = TextTheme(
  displaySmall: TextStyle(
    fontFamily: 'Pretendard, Mont',
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 42.0,
  ),
  headlineMedium: TextStyle(
    fontFamily: 'Pretendard, Mont',
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 34.0,
  ),
  headlineSmall: TextStyle(
    fontFamily: 'Pretendard, Mont',
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 30.0,
  ),
  titleLarge: TextStyle(
    fontFamily: 'Pretendard, Mont',
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 24.0,
  ),
  titleMedium: TextStyle(
    fontFamily: 'Pretendard, Mont',
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 22.0,
  ),
  titleSmall: TextStyle(
    fontFamily: 'Pretendard, Mont',
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 20.0,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    height: 24.0,
  ),
  bodySmall: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    height: 22.0,
  ),
  labelMedium: TextStyle(
    fontFamily: 'Pretendard, Mont',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    height: 22.0,
  ),
  labelSmall: TextStyle(
    fontFamily: 'Pretendard, Mont',
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    height: 20.0,
  ),
);
