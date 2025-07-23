import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006a67),
      surfaceTint: Color(0xff006a67),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9cf1ed),
      onPrimaryContainer: Color(0xff00504d),
      secondary: Color(0xff4a6361),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffcce8e6),
      onSecondaryContainer: Color(0xff324b4a),
      tertiary: Color(0xff49607b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffd1e4ff),
      onTertiaryContainer: Color(0xff314862),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff4fbf9),
      onSurface: Color(0xff161d1c),
      onSurfaceVariant: Color(0xff3f4948),
      outline: Color(0xff6f7978),
      outlineVariant: Color(0xffbec9c7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3231),
      inversePrimary: Color(0xff80d5d0),
      primaryFixed: Color(0xff9cf1ed),
      onPrimaryFixed: Color(0xff00201f),
      primaryFixedDim: Color(0xff80d5d0),
      onPrimaryFixedVariant: Color(0xff00504d),
      secondaryFixed: Color(0xffcce8e6),
      onSecondaryFixed: Color(0xff051f1e),
      secondaryFixedDim: Color(0xffb0ccca),
      onSecondaryFixedVariant: Color(0xff324b4a),
      tertiaryFixed: Color(0xffd1e4ff),
      onTertiaryFixed: Color(0xff021d35),
      tertiaryFixedDim: Color(0xffb1c9e8),
      onTertiaryFixedVariant: Color(0xff314862),
      surfaceDim: Color(0xffd5dbda),
      surfaceBright: Color(0xfff4fbf9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f3),
      surfaceContainer: Color(0xffe9efee),
      surfaceContainerHigh: Color(0xffe3e9e8),
      surfaceContainerHighest: Color(0xffdde4e2),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003d3b),
      surfaceTint: Color(0xff006a67),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff187976),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff213a39),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff587270),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff203851),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff586f8b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff4fbf9),
      onSurface: Color(0xff0c1212),
      onSurfaceVariant: Color(0xff2e3837),
      outline: Color(0xff4a5453),
      outlineVariant: Color(0xff656f6e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3231),
      inversePrimary: Color(0xff80d5d0),
      primaryFixed: Color(0xff187976),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff005f5c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff587270),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff405958),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff586f8b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff405671),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc1c8c7),
      surfaceBright: Color(0xfff4fbf9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f3),
      surfaceContainer: Color(0xffe3e9e8),
      surfaceContainerHigh: Color(0xffd8dedd),
      surfaceContainerHighest: Color(0xffccd3d2),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003231),
      surfaceTint: Color(0xff006a67),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff005250),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff17302f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff354e4c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff152e46),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff344b65),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff4fbf9),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff242e2d),
      outlineVariant: Color(0xff414b4a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3231),
      inversePrimary: Color(0xff80d5d0),
      primaryFixed: Color(0xff005250),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003938),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff354e4c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1e3736),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff344b65),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff1c344d),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb3bab9),
      surfaceBright: Color(0xfff4fbf9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffecf2f1),
      surfaceContainer: Color(0xffdde4e2),
      surfaceContainerHigh: Color(0xffcfd6d4),
      surfaceContainerHighest: Color(0xffc1c8c7),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff80d5d0),
      surfaceTint: Color(0xff80d5d0),
      onPrimary: Color(0xff003735),
      primaryContainer: Color(0xff00504d),
      onPrimaryContainer: Color(0xff9cf1ed),
      secondary: Color(0xffb0ccca),
      onSecondary: Color(0xff1b3533),
      secondaryContainer: Color(0xff324b4a),
      onSecondaryContainer: Color(0xffcce8e6),
      tertiary: Color(0xffb1c9e8),
      onTertiary: Color(0xff1a324b),
      tertiaryContainer: Color(0xff314862),
      onTertiaryContainer: Color(0xffd1e4ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0e1514),
      onSurface: Color(0xffdde4e2),
      onSurfaceVariant: Color(0xffbec9c7),
      outline: Color(0xff889392),
      outlineVariant: Color(0xff3f4948),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e2),
      inversePrimary: Color(0xff006a67),
      primaryFixed: Color(0xff9cf1ed),
      onPrimaryFixed: Color(0xff00201f),
      primaryFixedDim: Color(0xff80d5d0),
      onPrimaryFixedVariant: Color(0xff00504d),
      secondaryFixed: Color(0xffcce8e6),
      onSecondaryFixed: Color(0xff051f1e),
      secondaryFixedDim: Color(0xffb0ccca),
      onSecondaryFixedVariant: Color(0xff324b4a),
      tertiaryFixed: Color(0xffd1e4ff),
      onTertiaryFixed: Color(0xff021d35),
      tertiaryFixedDim: Color(0xffb1c9e8),
      onTertiaryFixedVariant: Color(0xff314862),
      surfaceDim: Color(0xff0e1514),
      surfaceBright: Color(0xff343a3a),
      surfaceContainerLowest: Color(0xff090f0f),
      surfaceContainerLow: Color(0xff161d1c),
      surfaceContainer: Color(0xff1a2120),
      surfaceContainerHigh: Color(0xff252b2b),
      surfaceContainerHighest: Color(0xff2f3635),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff96ebe6),
      surfaceTint: Color(0xff80d5d0),
      onPrimary: Color(0xff002b2a),
      primaryContainer: Color(0xff479e9a),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffc6e2df),
      onSecondary: Color(0xff102a28),
      secondaryContainer: Color(0xff7b9694),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffc7defe),
      onTertiary: Color(0xff0d273f),
      tertiaryContainer: Color(0xff7b93b0),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1514),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd4dedd),
      outline: Color(0xffaab4b3),
      outlineVariant: Color(0xff889291),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e2),
      inversePrimary: Color(0xff00514f),
      primaryFixed: Color(0xff9cf1ed),
      onPrimaryFixed: Color(0xff001414),
      primaryFixedDim: Color(0xff80d5d0),
      onPrimaryFixedVariant: Color(0xff003d3b),
      secondaryFixed: Color(0xffcce8e6),
      onSecondaryFixed: Color(0xff001414),
      secondaryFixedDim: Color(0xffb0ccca),
      onSecondaryFixedVariant: Color(0xff213a39),
      tertiaryFixed: Color(0xffd1e4ff),
      onTertiaryFixed: Color(0xff001225),
      tertiaryFixedDim: Color(0xffb1c9e8),
      onTertiaryFixedVariant: Color(0xff203851),
      surfaceDim: Color(0xff0e1514),
      surfaceBright: Color(0xff3f4645),
      surfaceContainerLowest: Color(0xff040808),
      surfaceContainerLow: Color(0xff181f1e),
      surfaceContainer: Color(0xff232929),
      surfaceContainerHigh: Color(0xff2d3433),
      surfaceContainerHighest: Color(0xff383f3e),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffaafffa),
      surfaceTint: Color(0xff80d5d0),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff7cd1cc),
      onPrimaryContainer: Color(0xff000e0d),
      secondary: Color(0xffd9f6f3),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffadc8c6),
      onSecondaryContainer: Color(0xff000e0d),
      tertiary: Color(0xffe8f0ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffadc5e4),
      onTertiaryContainer: Color(0xff000c1b),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff0e1514),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe8f2f0),
      outlineVariant: Color(0xffbac5c3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e2),
      inversePrimary: Color(0xff00514f),
      primaryFixed: Color(0xff9cf1ed),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff80d5d0),
      onPrimaryFixedVariant: Color(0xff001414),
      secondaryFixed: Color(0xffcce8e6),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb0ccca),
      onSecondaryFixedVariant: Color(0xff001414),
      tertiaryFixed: Color(0xffd1e4ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffb1c9e8),
      onTertiaryFixedVariant: Color(0xff001225),
      surfaceDim: Color(0xff0e1514),
      surfaceBright: Color(0xff4b5151),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1a2120),
      surfaceContainer: Color(0xff2b3231),
      surfaceContainerHigh: Color(0xff363d3c),
      surfaceContainerHighest: Color(0xff414847),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
