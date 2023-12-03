import 'package:flutter/material.dart';

/// A service that stores and retrieves app theme mode.
abstract class IThemeService extends ChangeNotifier {
  ThemeMode get currentThemeMode;
  void switchTheme();
  void updateThemeMode(ThemeMode newThemeMode);
}

class ThemeServiceImpl extends IThemeService {
  ThemeServiceImpl(this._themeMode);
  @override
  ThemeMode get currentThemeMode => _themeMode;

  late ThemeMode _themeMode;

  @override
  void switchTheme() {
    _themeMode == ThemeMode.light
        ? _themeMode = ThemeMode.dark
        : _themeMode = ThemeMode.light;
    notifyListeners();
  }

  @override
  void updateThemeMode(ThemeMode newThemeMode) {
    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;

    notifyListeners();
  }
}
