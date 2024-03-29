import 'package:flutter/material.dart';
import 'package:cofrecito/themes/default.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider({required bool darkmodeEnabled})
      : currentTheme =
            (darkmodeEnabled) ? DefaultTheme.defaultTheme : ThemeData.light();

  setDark() {
    currentTheme = DefaultTheme.defaultTheme;
    notifyListeners();
  }

  setLight() {
    currentTheme = ThemeData.light();
    notifyListeners();
  }
}
