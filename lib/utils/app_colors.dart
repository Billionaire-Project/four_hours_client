import 'package:flutter/material.dart';

class CustomColors extends AppLightColors with AppDarkColors {
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  static final AppLightColors light = AppLightColors();
  static final AppDarkColors dark = AppDarkColors();
}

class AppLightColors {
  Color get red => const Color(0xFFE00E02);
  Color get blue => const Color(0xFF1977E6);
  Color get orange => const Color(0xFFFF7C32);

  Color get gray50 => const Color(0xFFF5F5F5);
  Color get gray100 => const Color(0xFFEFEFEF);
  Color get gray200 => const Color(0xFFE2E2E2);
  Color get gray300 => const Color(0xFFBFBFBF);
  Color get gray400 => const Color(0xFFA0A0A0);
  Color get gray500 => const Color(0xFF777777);
  Color get gray600 => const Color(0xFF636363);
  Color get gray700 => const Color(0xFF444444);
  Color get gray800 => const Color(0xFF232527);
  Color get gray900 => const Color(0xFF121314);
}

class AppDarkColors {
  Color get red => const Color(0xFFEB3B3B);
  Color get blue => const Color(0xFF1977E6);
  Color get orange => const Color(0xFFF87831);

  Color get gray50 => const Color(0xFF121314);
  Color get gray100 => const Color(0xFF2B2C2C);
  Color get gray200 => const Color(0xFF434445);
  Color get gray300 => const Color(0xFF5C5D5D);
  Color get gray400 => const Color(0xFF656567);
  Color get gray500 => const Color(0xFF8D8E8E);
  Color get gray600 => const Color(0xFFA6A6A7);
  Color get gray700 => const Color(0xFFBFBFBF);
  Color get gray800 => const Color(0xFFD7D7D8);
  Color get gray900 => const Color(0xFFF0F0F0);
}
