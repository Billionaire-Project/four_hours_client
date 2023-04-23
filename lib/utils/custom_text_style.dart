import 'package:flutter/material.dart';

class CustomTextStyle {
  BuildContext context;
  CustomTextStyle(this.context);

  //* Pretendard Text Style *//
  TextStyle get displaySmall => Theme.of(context).textTheme.displaySmall!;

  TextStyle get headlineMedium => Theme.of(context).textTheme.headlineMedium!;
  TextStyle get headlineSmall => Theme.of(context).textTheme.headlineSmall!;

  TextStyle get titleLarge => Theme.of(context).textTheme.titleLarge!;
  TextStyle get titleMedium => Theme.of(context).textTheme.titleMedium!;
  TextStyle get titleSmall => Theme.of(context).textTheme.titleSmall!;

  TextStyle get bodyMedium => Theme.of(context).textTheme.bodyMedium!;
  TextStyle get bodySmall => Theme.of(context).textTheme.bodySmall!;

  TextStyle get labelMedium => Theme.of(context).textTheme.labelMedium!;
  TextStyle get labelSmall => Theme.of(context).textTheme.labelSmall!;

  TextStyle get caption => TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 13,
        height: 1.35,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).textTheme.labelSmall!.color,
      );

  TextStyle get overline => TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 12,
        height: 1.35,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).textTheme.labelSmall!.color,
      );

  //* Mont Text Style *//
  TextStyle get montDisplaySmall => TextStyle(
        fontFamily: 'Mont',
        fontSize: 32.0,
        fontWeight: FontWeight.w900,
        height: 1.25,
        color: Theme.of(context).textTheme.displaySmall!.color,
      );

  TextStyle get montHeadlineMedium => TextStyle(
        fontFamily: 'Mont',
        fontSize: 24.0,
        fontWeight: FontWeight.w900,
        height: 1.35,
        color: Theme.of(context).textTheme.headlineMedium!.color,
      );

  TextStyle get montHeadlineSmall => TextStyle(
        fontFamily: 'Mont',
        fontSize: 20.0,
        fontWeight: FontWeight.w900,
        height: 1.5,
        color: Theme.of(context).textTheme.headlineSmall!.color,
      );

  TextStyle get montTitleLarge => TextStyle(
        fontFamily: 'Mont',
        fontSize: 18.0,
        fontWeight: FontWeight.w900,
        height: 1.35,
        color: Theme.of(context).textTheme.titleLarge!.color,
      );

  TextStyle get montTitleMedium => TextStyle(
        fontFamily: 'Mont',
        fontSize: 16.0,
        fontWeight: FontWeight.w900,
        height: 1.35,
        color: Theme.of(context).textTheme.titleMedium!.color,
      );

  TextStyle get montTitleSmall => TextStyle(
        fontFamily: 'Mont',
        fontSize: 14.0,
        fontWeight: FontWeight.w900,
        height: 1.4,
        color: Theme.of(context).textTheme.titleSmall!.color,
      );

  TextStyle get montLabelMedium => TextStyle(
        fontFamily: 'Mont',
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        height: 1.35,
        color: Theme.of(context).textTheme.labelMedium!.color,
      );

  TextStyle get montLabelSmall => TextStyle(
        fontFamily: 'Mont',
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        height: 1.4,
        color: Theme.of(context).textTheme.labelSmall!.color,
      );
}
