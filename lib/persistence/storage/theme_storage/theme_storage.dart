import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IThemeModeStorage {
  Future<ThemeMode?> getThemeMode();
  Future<void> saveThemeMode({required ThemeMode mode});
}

class ThemeModeStorageImpl implements IThemeModeStorage {
  ThemeModeStorageImpl();
  static const String _themeModeKey = 'theme_mode';

  @override
  Future<ThemeMode?> getThemeMode() async {
    final themeName =
        (await SharedPreferences.getInstance()).getString(_themeModeKey);
    if (themeName?.isEmpty ?? true) return null;
    return ThemeMode.values.firstWhereOrNull((e) => e.name == themeName);
  }

  @override
  Future<void> saveThemeMode({required ThemeMode mode}) async {
    await (await SharedPreferences.getInstance())
        .setString(_themeModeKey, mode.name);
  }
}
