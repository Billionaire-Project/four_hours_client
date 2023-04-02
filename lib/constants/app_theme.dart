import 'package:flutter/material.dart';
import 'package:four_hours_client/constants/app_color_scheme.dart';
import 'package:four_hours_client/constants/app_colors.dart';
import 'package:four_hours_client/constants/app_text_theme.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      colorScheme: lightColorScheme,
      buttonTheme: ButtonThemeData(
        height: 48,
        buttonColor: AppLightColors.gray900,
        hoverColor: AppLightColors.gray900.withOpacity(0.7),
        splashColor: AppLightColors.gray900.withOpacity(0.5),
        disabledColor: AppLightColors.gray200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
          foregroundColor: AppLightColors.gray50,
          backgroundColor: AppLightColors.gray900,
          disabledBackgroundColor: AppLightColors.gray200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.all(13),
        ),
      ),
      iconTheme: const IconThemeData(
        size: 20,
        opticalSize: 20,
        color: AppLightColors.black,
      ),
      textTheme: lightTextTheme);

  static final ThemeData darkTheme = ThemeData(
      colorScheme: darkColorsScheme,
      buttonTheme: ButtonThemeData(
        height: 48,
        buttonColor: AppDarkColors.gray900,
        hoverColor: AppDarkColors.gray900.withOpacity(0.7),
        splashColor: AppDarkColors.gray900.withOpacity(0.5),
        disabledColor: AppDarkColors.gray200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
          foregroundColor: AppDarkColors.gray50,
          backgroundColor: AppDarkColors.gray900,
          disabledBackgroundColor: AppDarkColors.gray200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.all(13),
        ),
      ),
      iconTheme: const IconThemeData(
        size: 20,
        opticalSize: 20,
        color: AppLightColors.white,
      ),
      textTheme: darkTextTheme);
}
