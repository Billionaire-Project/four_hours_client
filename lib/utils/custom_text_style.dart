import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';

class CustomTextStyle {
  CustomThemeColors customThemeColors;
  CustomTextStyle(this.customThemeColors);

  //* Pretendard Text Style *//
  TextStyle get displaySmall => TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 32.0,
        height: 1.25,
        color: customThemeColors.textPrimary,
        fontVariations: const <FontVariation>[
          FontVariation('wght', 700),
        ],
      );

  TextStyle get headlineMedium => TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 24.0,
        height: 1.35,
        color: customThemeColors.textPrimary,
        fontVariations: const <FontVariation>[
          FontVariation('wght', 700),
        ],
      );

  TextStyle get headlineSmall => TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 20.0,
        height: 1.5,
        color: customThemeColors.textPrimary,
        fontVariations: const <FontVariation>[
          FontVariation('wght', 700),
        ],
      );

  TextStyle get titleLarge => TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 18.0,
        height: 1.35,
        color: customThemeColors.textPrimary,
        fontVariations: const <FontVariation>[
          FontVariation('wght', 700),
        ],
      );

  TextStyle get titleMedium => TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 16.0,
        height: 1.35,
        color: customThemeColors.textPrimary,
        fontVariations: const <FontVariation>[
          FontVariation('wght', 700),
        ],
      );

  TextStyle get titleSmall => TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 14.0,
        height: 1.4,
        color: customThemeColors.textPrimary,
        fontVariations: const <FontVariation>[
          FontVariation('wght', 700),
        ],
      );

  TextStyle get bodyMedium => TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 16.0,
        height: 1.5,
        color: customThemeColors.textPrimary,
        fontVariations: const <FontVariation>[
          FontVariation('wght', 400),
        ],
      );

  TextStyle get bodySmall => TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 14.0,
        height: 1.5,
        color: customThemeColors.textPrimary,
        fontVariations: const <FontVariation>[
          FontVariation('wght', 400),
        ],
      );

  TextStyle get labelMedium => TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 16.0,
        height: 1.35,
        color: customThemeColors.textPrimary,
        fontVariations: const <FontVariation>[
          FontVariation('wght', 500),
        ],
      );

  TextStyle get labelSmall => TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 14.0,
        height: 1.35,
        color: customThemeColors.textPrimary,
        fontVariations: const <FontVariation>[
          FontVariation('wght', 500),
        ],
      );

  TextStyle get caption => TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 13,
        height: 1.35,
        color: customThemeColors.textPrimary,
        fontVariations: const <FontVariation>[
          FontVariation('wght', 500),
        ],
      );

  TextStyle get overline => TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 12,
        height: 1.35,
        color: customThemeColors.textPrimary,
        fontVariations: const <FontVariation>[
          FontVariation('wght', 500),
        ],
      );

  //* Mont Text Style *//
  TextStyle get montDisplaySmall => TextStyle(
        fontFamily: 'Mont',
        fontSize: 32.0,
        height: 1.25,
        color: customThemeColors.textPrimary,
        fontWeight: FontWeight.w900,
      );

  TextStyle get montHeadlineMedium => TextStyle(
        fontFamily: 'Mont',
        fontSize: 24.0,
        height: 1.35,
        color: customThemeColors.textPrimary,
        fontWeight: FontWeight.w900,
      );

  TextStyle get montHeadlineSmall => TextStyle(
        fontFamily: 'Mont',
        fontSize: 20.0,
        height: 1.5,
        color: customThemeColors.textPrimary,
        fontWeight: FontWeight.w900,
      );

  TextStyle get montTitleLarge => TextStyle(
        fontFamily: 'Mont',
        fontSize: 18.0,
        height: 1.35,
        color: customThemeColors.textPrimary,
        fontWeight: FontWeight.w900,
      );

  TextStyle get montTitleMedium => TextStyle(
        fontFamily: 'Mont',
        fontSize: 16.0,
        height: 1.35,
        color: customThemeColors.textPrimary,
        fontWeight: FontWeight.w900,
      );

  TextStyle get montTitleSmall => TextStyle(
        fontFamily: 'Mont',
        fontSize: 14.0,
        height: 1.4,
        color: customThemeColors.textPrimary,
        fontWeight: FontWeight.w900,
      );

  TextStyle get montLabelMedium => TextStyle(
        fontFamily: 'Mont',
        fontSize: 16.0,
        height: 1.35,
        color: customThemeColors.textPrimary,
        fontWeight: FontWeight.w500,
      );

  TextStyle get montLabelSmall => TextStyle(
        fontFamily: 'Mont',
        fontSize: 14.0,
        height: 1.4,
        color: customThemeColors.textPrimary,
        fontWeight: FontWeight.w500,
      );
}

final customTextStyleProvider =
    Provider((ref) => CustomTextStyle(ref.watch(customThemeColorsProvider)));
