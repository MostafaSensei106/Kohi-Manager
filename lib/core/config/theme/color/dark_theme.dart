/// Contains the dark theme configuration for the TakyeebBak app.
///
/// This theme is based on a customized [ColorScheme] for dark mode,
/// providing a consistent look and feel across the app with warm,
/// muted tones for primary, secondary, and tertiary colors.
///
/// The [DarkTheme] includes:
/// - A full [ColorScheme] tailored for dark mode
/// - Transparent and flat [AppBarTheme] for modern UI appearance
///
/// Example usage:
/// ```dart
/// MaterialApp(
///   theme: DarkTheme,
/// )
/// ```
library;

import 'package:flutter/material.dart'
    show ThemeData, ColorScheme, AppBarTheme, Brightness, Color, Colors;

/// A preconfigured [ThemeData] for the app's dark theme.
///
/// Defines a full [ColorScheme] with carefully selected color values
/// for primary, secondary, tertiary, background, surface, error,
/// and outlines in dark mode.
///
/// This theme uses:
/// - `Brightness.dark`
/// - Transparent AppBar with no elevation
final ThemeData DarkTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff9ccbfb),
    surfaceTint: Color(0xff9ccbfb),
    onPrimary: Color(0xff003354),
    primaryContainer: Color(0xff114a73),
    onPrimaryContainer: Color(0xffcfe5ff),
    secondary: Color(0xffb9c8da),
    onSecondary: Color(0xff243240),
    secondaryContainer: Color(0xff3a4857),
    onSecondaryContainer: Color(0xffd5e4f7),
    tertiary: Color(0xffd4bee6),
    onTertiary: Color(0xff392a49),
    tertiaryContainer: Color(0xff504060),
    onTertiaryContainer: Color(0xffefdbff),
    error: Color(0xffffb4ab),
    onError: Color(0xff690005),
    errorContainer: Color(0xff93000a),
    onErrorContainer: Color(0xffffdad6),
    surface: Color(0xff101418),
    onSurface: Color(0xffe0e2e8),
    onSurfaceVariant: Color(0xffc2c7cf),
    outline: Color(0xff8c9199),
    outlineVariant: Color(0xff42474e),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xffe0e2e8),
    inversePrimary: Color(0xff31628d),
    primaryFixed: Color(0xffcfe5ff),
    onPrimaryFixed: Color(0xff001d33),
    primaryFixedDim: Color(0xff9ccbfb),
    onPrimaryFixedVariant: Color(0xff114a73),
    secondaryFixed: Color(0xffd5e4f7),
    onSecondaryFixed: Color(0xff0e1d2a),
    secondaryFixedDim: Color(0xffb9c8da),
    onSecondaryFixedVariant: Color(0xff3a4857),
    tertiaryFixed: Color(0xffefdbff),
    onTertiaryFixed: Color(0xff231533),
    tertiaryFixedDim: Color(0xffd4bee6),
    onTertiaryFixedVariant: Color(0xff504060),
    surfaceDim: Color(0xff101418),
    surfaceBright: Color(0xff36393e),
    surfaceContainerLowest: Color(0xff0b0e12),
    surfaceContainerLow: Color(0xff181c20),
    surfaceContainer: Color(0xff1c2024),
    surfaceContainerHigh: Color(0xff272a2f),
    surfaceContainerHighest: Color(0xff32353a),
  ),

  /// Custom AppBarTheme with a transparent background and no elevation.
  ///
  /// Makes the app bar blend seamlessly with the UI.
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
  ),

  fontFamily: 'ArFont',
);
