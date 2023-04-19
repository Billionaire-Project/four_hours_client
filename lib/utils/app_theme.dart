import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';

class AppThemeNotifier extends Notifier<ThemeData> {
  @override
  ThemeData build() {
    final customThemeColors = ref.watch(customThemeColorsProvider);
    return ThemeData(
      fontFamily: 'Pretendard',
      brightness: Brightness.light,
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: customThemeColors.textSecondary),
        isDense: true,
        contentPadding: const EdgeInsets.all(0),
      ),
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: customThemeColors.primary),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: customThemeColors.buttonPrimary,
          foregroundColor: customThemeColors.textInvert,
          disabledBackgroundColor: customThemeColors.buttonDisabled,
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
    );
  }
}

final appThemeProvider =
    NotifierProvider<AppThemeNotifier, ThemeData>(AppThemeNotifier.new);
