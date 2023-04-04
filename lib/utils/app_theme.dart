import 'package:flutter/material.dart';
import 'package:four_hours_client/utils/app_color_scheme.dart';
import 'package:four_hours_client/utils/app_colors.dart';
import 'package:four_hours_client/utils/app_text_theme.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      dividerColor: CustomColors.light.gray200,
      colorScheme: lightColorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: CustomColors.white,
        foregroundColor: CustomColors.black,
        elevation: 0,
        shadowColor: null,
        iconTheme: IconThemeData(color: CustomColors.light.gray900),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
          foregroundColor: CustomColors.light.gray50,
          backgroundColor: CustomColors.light.gray900,
          disabledBackgroundColor: CustomColors.light.gray200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.all(13),
        ),
      ),
      iconTheme: IconThemeData(
        size: 20,
        opticalSize: 20,
        color: CustomColors.light.gray900,
      ),
      textTheme: lightTextTheme);

  static final ThemeData darkTheme = ThemeData(
      dividerColor: CustomColors.dark.gray200,
      colorScheme: darkColorsScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: CustomColors.black,
        foregroundColor: CustomColors.white,
        elevation: 0,
        shadowColor: null,
        iconTheme: IconThemeData(color: CustomColors.dark.gray900),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
          foregroundColor: CustomColors.dark.gray50,
          backgroundColor: CustomColors.dark.gray900,
          disabledBackgroundColor: CustomColors.dark.gray200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.all(13),
        ),
      ),
      iconTheme: IconThemeData(
        size: 20,
        opticalSize: 20,
        color: CustomColors.dark.gray900,
      ),
      textTheme: darkTextTheme);
}
