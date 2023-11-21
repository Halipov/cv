import 'package:cv/assets/color/color_scheme.dart';
import 'package:cv/assets/text/text_extention.dart';
import 'package:flutter/material.dart';

/// Class of the app themes data.
abstract class AppThemeData {
  /// Light theme configuration.
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _lightColorScheme.primary,
      onPrimary: _lightColorScheme.onPrimary,
      secondary: _lightColorScheme.secondary,
      onSecondary: _lightColorScheme.onSecondary,
      error: _lightColorScheme.danger,
      onError: _lightColorScheme.onDanger,
      background: _lightColorScheme.background,
      onBackground: _lightColorScheme.onBackground,
      surface: _lightColorScheme.surface,
      onSurface: _lightColorScheme.onSurface,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _lightColorScheme.primary,
      contentTextStyle: TextStyle(
        color: _lightColorScheme.onPrimary,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: _lightColorScheme.primary,
      elevation: 0,
      iconTheme: IconThemeData(
        color: _lightColorScheme.onPrimary,
      ),
    ),
    scaffoldBackgroundColor: _lightColorScheme.background,
    extensions: [_lightColorScheme, _lightTextTheme],
  );

  /// Dark theme configuration.
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: _darkColorScheme.primary,
      onPrimary: _darkColorScheme.onPrimary,
      secondary: _darkColorScheme.secondary,
      onSecondary: _darkColorScheme.onSecondary,
      error: _darkColorScheme.danger,
      onError: _darkColorScheme.onDanger,
      background: _darkColorScheme.background,
      onBackground: _darkColorScheme.onBackground,
      surface: _darkColorScheme.surface,
      onSurface: _darkColorScheme.onSurface,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _darkColorScheme.primary,
      contentTextStyle: TextStyle(
        color: _darkColorScheme.onPrimary,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: _lightColorScheme.primary,
      elevation: 0,
      iconTheme: IconThemeData(
        color: _lightColorScheme.onPrimary,
      ),
    ),
    scaffoldBackgroundColor: _darkColorScheme.background,
    extensions: [_darkColorScheme, _darkTextTheme],
  );

  static final _lightColorScheme = AppColorScheme.light();
  static final _darkColorScheme = AppColorScheme.dark();
  static final _lightTextTheme = AppTextTheme.light();
  static final _darkTextTheme = AppTextTheme.dark();
}
