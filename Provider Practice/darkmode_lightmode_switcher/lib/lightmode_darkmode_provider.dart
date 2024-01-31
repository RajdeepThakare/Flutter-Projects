import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // Define a variable to store the current theme mode
  ThemeMode currentThemeMode = ThemeMode.system;

  // Define a method to switch the theme mode
  void switchThemeMode(ThemeMode themeMode) {
    // Update the variable with the new theme mode
    currentThemeMode = themeMode;
    // Notify the listeners of the change
    notifyListeners();
  }
}
