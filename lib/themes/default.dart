import 'package:flutter/material.dart';

class DefaultTheme {
  static const Color primaryDark = Color.fromRGBO(14, 25, 29, 1);
  static const Color primaryLight = Color.fromRGBO(17, 33, 32, 1);
  static const Color secondaryDark = Color.fromRGBO(86, 70, 36, 1);
  static const Color secondaryMedium = Color.fromRGBO(174, 145, 75, 1);
  static const Color secondaryLight = Color.fromRGBO(244, 233, 148, 1);
  static const Color tertiaryDark = Color.fromRGBO(20, 85, 91, 1);
  static const Color tertiaryMedium = Color.fromRGBO(58, 120, 117, 1);
  static const Color tertiaryLight = Color.fromRGBO(166, 245, 216, 1);
  static const Color tertiaryUltraLight = Color.fromRGBO(235, 235, 235, 1);

  static final ThemeData defaultTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: primaryDark,
    primaryColor: primaryLight,
    appBarTheme: const AppBarTheme(
        backgroundColor: primaryLight, foregroundColor: secondaryLight),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: tertiaryMedium, foregroundColor: Colors.white)),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: tertiaryMedium, foregroundColor: primaryLight),
    listTileTheme: const ListTileThemeData(iconColor: secondaryMedium),
  );

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: tertiaryMedium,
      scaffoldBackgroundColor: tertiaryUltraLight,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, foregroundColor: tertiaryMedium),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: tertiaryMedium, foregroundColor: Colors.white)),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: tertiaryMedium)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: tertiaryMedium, foregroundColor: Colors.white),
      listTileTheme: const ListTileThemeData(iconColor: tertiaryMedium));
}
