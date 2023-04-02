import 'dart:ui';

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
      color: Colors.black,
      height: 1.25,
      fontVariations: <FontVariation>[
        FontVariation('wght', 700),
      ]),
  headlineMedium: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 24.0,
      color: Colors.black,
      height: 1.35,
      fontVariations: <FontVariation>[
        FontVariation('wght', 700),
      ]),
  headlineSmall: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 20.0,
      color: Colors.black,
      height: 1.5,
      fontVariations: <FontVariation>[
        FontVariation('wght', 700),
      ]),
  titleLarge: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 18.0,
      color: Colors.black,
      height: 1.35,
      fontVariations: <FontVariation>[
        FontVariation('wght', 700),
      ]),
  titleMedium: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 16.0,
      color: Colors.black,
      height: 1.35,
      fontVariations: <FontVariation>[
        FontVariation('wght', 700),
      ]),
  titleSmall: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 14.0,
      color: Colors.black,
      height: 1.4,
      fontVariations: <FontVariation>[
        FontVariation('wght', 700),
      ]),
  bodyMedium: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 16.0,
      color: Colors.black,
      height: 1.5,
      fontVariations: <FontVariation>[
        FontVariation('wght', 400),
      ]),
  bodySmall: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 14.0,
      color: Colors.black,
      height: 1.5,
      fontVariations: <FontVariation>[
        FontVariation('wght', 400),
      ]),
  labelMedium: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 16.0,
      color: Colors.black,
      height: 1.35,
      fontVariations: <FontVariation>[
        FontVariation('wght', 500),
      ]),
  labelSmall: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 14.0,
      color: Colors.black,
      height: 1.4,
      fontVariations: <FontVariation>[
        FontVariation('wght', 500),
      ]),
);
