/// Contains the light theme configuration for the TakyeebBak app.
///
/// This theme is based on a customized [ColorScheme] for light mode,
/// providing a clean and elegant UI appearance using warm and earthy tones.
///
/// The [LightTheme] includes:
/// - A complete [ColorScheme] for light mode
/// - Transparent [AppBarTheme] for modern UI
/// - Support for elevated surface and background contrasts
///
/// Example usage:
/// ```dart
/// MaterialApp(
///   theme: LightTheme,
/// )
/// ```
library;

import 'package:flutter/material.dart'
    show ColorScheme, ThemeData, AppBarTheme, Brightness, Color, Colors;

/// A preconfigured [ThemeData] for the app's light theme.
///
/// Defines a full [ColorScheme] with carefully selected color values
/// optimized for light backgrounds. This ensures proper contrast and
/// accessibility across the app UI.
///
/// Includes:
/// - `Brightness.light` for overall brightness
/// - Transparent AppBar with no shadow for a flat and modern appearance
final ThemeData LightTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff31628d),
    surfaceTint: Color(0xff31628d),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xffcfe5ff),
    onPrimaryContainer: Color(0xff114a73),
    secondary: Color(0xff526070),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xffd5e4f7),
    onSecondaryContainer: Color(0xff3a4857),
    tertiary: Color(0xff695779),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xffefdbff),
    onTertiaryContainer: Color(0xff504060),
    error: Color(0xffba1a1a),
    onError: Color(0xffffffff),
    errorContainer: Color(0xffffdad6),
    onErrorContainer: Color(0xff93000a),
    surface: Color(0xfff7f9ff),
    onSurface: Color(0xff181c20),
    onSurfaceVariant: Color(0xff42474e),
    outline: Color(0xff72777f),
    outlineVariant: Color(0xffc2c7cf),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xff2d3135),
    inversePrimary: Color(0xff9ccbfb),
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
    surfaceDim: Color(0xffd8dae0),
    surfaceBright: Color(0xfff7f9ff),
    surfaceContainerLowest: Color(0xffffffff),
    surfaceContainerLow: Color(0xfff2f3f9),
    surfaceContainer: Color(0xffeceef4),
    surfaceContainerHigh: Color(0xffe6e8ee),
    surfaceContainerHighest: Color(0xffe0e2e8),
  ),

  /// Custom AppBarTheme with a transparent background and no elevation.
  ///
  /// Gives the app bar a clean and modern look.
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
  ),

  fontFamily: 'ArFont',
);
