import 'package:cv/assets/color/color_palette.dart';
import 'package:flutter/material.dart';

@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  /// Base light theme version.
  AppColorScheme.light()
      : primary = ColorPalette.purple,
        onPrimary = ColorPalette.white,
        secondary = ColorPalette.lightPurple,
        onSecondary = ColorPalette.chineseBlack,
        surface = ColorPalette.white,
        surfaceSecondary = ColorPalette.cultured,
        onSurface = ColorPalette.chineseBlack,
        background = ColorPalette.cultured,
        backgroundSecondary = ColorPalette.darkScarlet,
        backgroundTertiary = ColorPalette.cultured,
        onBackground = ColorPalette.chineseBlack,
        onBackgroundSecondary = ColorPalette.white,
        danger = ColorPalette.folly,
        dangerSecondary = ColorPalette.vividRaspberry,
        onDanger = ColorPalette.white,
        textField = ColorPalette.chineseBlack,
        textFieldLabel = ColorPalette.black,
        textFieldHelper = ColorPalette.black,
        inactive = ColorPalette.black,
        positive = ColorPalette.greenYellow,
        onPositive = ColorPalette.chineseBlack,
        skeletonPrimary = ColorPalette.black.withOpacity(0.06),
        skeletonOnPrimary = ColorPalette.white,
        skeletonSecondary = ColorPalette.cultured,
        skeletonTertiary = ColorPalette.lightSilver,
        tetradicBackground = ColorPalette.lightGreen;

  /// Base dark theme version.
  AppColorScheme.dark()
      : primary = DarkColorPalette.blue,
        onPrimary = DarkColorPalette.white,
        secondary = DarkColorPalette.inchworm,
        onSecondary = DarkColorPalette.black,
        surface = DarkColorPalette.white,
        surfaceSecondary = DarkColorPalette.raisinBlack,
        onSurface = DarkColorPalette.white,
        background = DarkColorPalette.raisinBlack,
        backgroundSecondary = DarkColorPalette.maroon,
        backgroundTertiary = DarkColorPalette.raisinBlack,
        onBackground = DarkColorPalette.white,
        onBackgroundSecondary = DarkColorPalette.white,
        danger = DarkColorPalette.brinkPink,
        dangerSecondary = DarkColorPalette.cyclamen,
        onDanger = DarkColorPalette.white,
        textField = DarkColorPalette.lightSilver,
        textFieldLabel = DarkColorPalette.white,
        textFieldHelper = DarkColorPalette.black,
        inactive = DarkColorPalette.black,
        positive = DarkColorPalette.inchworm,
        onPositive = DarkColorPalette.black,
        skeletonPrimary = DarkColorPalette.black.withOpacity(0.06),
        skeletonOnPrimary = DarkColorPalette.white,
        skeletonSecondary = DarkColorPalette.raisinBlack,
        skeletonTertiary = DarkColorPalette.lightSilver,
        tetradicBackground = DarkColorPalette.etonBlue;

  const AppColorScheme._({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.surface,
    required this.surfaceSecondary,
    required this.onSurface,
    required this.background,
    required this.backgroundSecondary,
    required this.backgroundTertiary,
    required this.onBackground,
    required this.onBackgroundSecondary,
    required this.danger,
    required this.dangerSecondary,
    required this.onDanger,
    required this.textField,
    required this.textFieldLabel,
    required this.textFieldHelper,
    required this.inactive,
    required this.positive,
    required this.onPositive,
    required this.skeletonPrimary,
    required this.skeletonOnPrimary,
    required this.skeletonSecondary,
    required this.skeletonTertiary,
    required this.tetradicBackground,
  });

  /// Base branding color for the app.
  ///
  /// Can be used as an accent color for buttons, switches, labels, icons, etc.
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color surface;
  final Color surfaceSecondary;
  final Color onSurface;
  final Color background;
  final Color backgroundSecondary;
  final Color backgroundTertiary;
  final Color tetradicBackground;
  final Color onBackground;
  final Color onBackgroundSecondary;
  final Color danger;
  final Color dangerSecondary;
  final Color onDanger;
  final Color textField;
  final Color textFieldLabel;
  final Color textFieldHelper;
  final Color inactive;
  final Color positive;
  final Color onPositive;
  final Color skeletonPrimary;
  final Color skeletonOnPrimary;
  final Color skeletonSecondary;
  final Color skeletonTertiary;

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? surface,
    Color? surfaceSecondary,
    Color? onSurface,
    Color? background,
    Color? backgroundSecondary,
    Color? backgroundTertiary,
    Color? onBackground,
    Color? onBackgroundSecondary,
    Color? danger,
    Color? dangerSecondary,
    Color? onDanger,
    Color? textField,
    Color? textFieldLabel,
    Color? textFieldHelper,
    Color? frameTextFieldSecondary,
    Color? inactive,
    Color? positive,
    Color? onPositive,
    Color? skeletonPrimary,
    Color? skeletonOnPrimary,
    Color? skeletonSecondary,
    Color? skeletonTertiary,
    Color? tetradicBackground,
  }) =>
      AppColorScheme._(
        primary: primary ?? this.primary,
        onPrimary: onPrimary ?? this.onPrimary,
        secondary: secondary ?? this.secondary,
        onSecondary: onSecondary ?? this.onSecondary,
        surface: surface ?? this.surface,
        surfaceSecondary: surfaceSecondary ?? this.surfaceSecondary,
        onSurface: onSurface ?? this.onSurface,
        background: background ?? this.background,
        onBackground: onBackground ?? this.onBackground,
        danger: danger ?? this.danger,
        dangerSecondary: dangerSecondary ?? this.dangerSecondary,
        onDanger: onDanger ?? this.onDanger,
        backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
        onBackgroundSecondary:
            onBackgroundSecondary ?? this.onBackgroundSecondary,
        backgroundTertiary: backgroundTertiary ?? this.backgroundTertiary,
        textField: textField ?? this.textField,
        textFieldLabel: textFieldLabel ?? this.textFieldLabel,
        textFieldHelper: textFieldHelper ?? this.textFieldHelper,
        inactive: inactive ?? this.inactive,
        positive: positive ?? this.positive,
        onPositive: onPositive ?? this.onPositive,
        skeletonPrimary: skeletonPrimary ?? this.skeletonPrimary,
        skeletonOnPrimary: skeletonOnPrimary ?? this.skeletonOnPrimary,
        skeletonSecondary: skeletonSecondary ?? this.skeletonSecondary,
        skeletonTertiary: skeletonTertiary ?? this.skeletonTertiary,
        tetradicBackground: tetradicBackground ?? this.tetradicBackground,
      );

  @override
  ThemeExtension<AppColorScheme> lerp(
    ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) {
      return this;
    }

    return AppColorScheme._(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceSecondary:
          Color.lerp(surfaceSecondary, other.surfaceSecondary, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      background: Color.lerp(background, other.background, t)!,
      backgroundSecondary:
          Color.lerp(backgroundSecondary, other.backgroundSecondary, t)!,
      backgroundTertiary:
          Color.lerp(backgroundTertiary, other.backgroundTertiary, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      onBackgroundSecondary:
          Color.lerp(onBackgroundSecondary, other.onBackgroundSecondary, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      dangerSecondary: Color.lerp(dangerSecondary, other.dangerSecondary, t)!,
      onDanger: Color.lerp(onDanger, other.onDanger, t)!,
      textField: Color.lerp(textField, other.textField, t)!,
      textFieldLabel: Color.lerp(textFieldLabel, other.textFieldLabel, t)!,
      textFieldHelper: Color.lerp(textFieldHelper, other.textFieldHelper, t)!,
      inactive: Color.lerp(inactive, other.inactive, t)!,
      positive: Color.lerp(positive, other.positive, t)!,
      onPositive: Color.lerp(onPositive, other.onPositive, t)!,
      skeletonPrimary: Color.lerp(skeletonPrimary, other.skeletonPrimary, t)!,
      skeletonOnPrimary:
          Color.lerp(skeletonOnPrimary, other.skeletonOnPrimary, t)!,
      skeletonSecondary:
          Color.lerp(skeletonSecondary, other.skeletonSecondary, t)!,
      skeletonTertiary:
          Color.lerp(skeletonTertiary, other.skeletonTertiary, t)!,
      tetradicBackground:
          Color.lerp(tetradicBackground, other.tetradicBackground, t)!,
    );
  }

  /// Returns [AppColorScheme] from [context].
  static AppColorScheme of(BuildContext context) =>
      Theme.of(context).extension<AppColorScheme>()!;
}
