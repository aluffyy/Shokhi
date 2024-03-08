import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  void toggleTheme(BuildContext context) {
    _themeMode = Theme.of(context).colorScheme.brightness == Brightness.dark
        ? ThemeMode.light
        : ThemeMode.dark;

    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;

    notifyListeners();
  }
}
