import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.teal,
    primaryColor: Colors.teal,
    appBarTheme: const AppBarTheme(
      color: Colors.teal,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    // colorScheme: const ColorScheme.light(
    //   primary: Colors.white,
    //   onPrimary: Colors.white,
    //   secondary: Colors.red,
    // ),
    // cardTheme: const CardTheme(
    //   color: Colors.teal,
    // ),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    // colorScheme: const ColorScheme.light(
    //   primary: Colors.black,
    //   onPrimary: Colors.black,
    //   secondary: Colors.red,
    // ),
    // cardTheme: const CardTheme(
    //   color: Colors.black,
    // ),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      titleLarge: TextStyle(
        color: Colors.white70,
        fontSize: 18.0,
      ),
    ),
  );
}
