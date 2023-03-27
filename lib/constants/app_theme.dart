import 'package:flutter/material.dart';
import 'package:four_hours_client/constants/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      fontFamily: 'Pretendard',
      colorScheme: _lightColorScheme,
      buttonTheme: ButtonThemeData(
        height: 48,
        buttonColor: AppLightColors.gray900,
        hoverColor: AppLightColors.gray900.withOpacity(0.7),
        splashColor: AppLightColors.gray900.withOpacity(0.5),
        disabledColor: AppLightColors.gray200,
      ),
      iconTheme: const IconThemeData(
        size: 20,
        opticalSize: 20,
        color: AppLightColors.black,
      ),
      textTheme: _textTheme);

  static final ThemeData darkTheme = ThemeData(
      colorScheme: _darkColorsScheme,
      buttonTheme: ButtonThemeData(
        height: 48,
        buttonColor: AppLightColors.gray900,
        hoverColor: AppLightColors.gray900.withOpacity(0.7),
        splashColor: AppLightColors.gray900.withOpacity(0.5),
        disabledColor: AppLightColors.gray200,
      ),
      iconTheme: const IconThemeData(
        size: 20,
        opticalSize: 20,
        color: AppLightColors.white,
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
    fontFamily: 'Pretendard',
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  headlineMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  headlineSmall: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  titleLarge: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  titleMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  titleSmall: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  ),
  bodySmall: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  ),
  labelMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),
  labelSmall: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),
);
