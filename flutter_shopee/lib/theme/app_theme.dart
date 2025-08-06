import 'package:flutter/material.dart';
import 'package:flutter_shopee/theme/dimensions.dart';

class AppTheme {
  static ThemeData lightTheme = _buildLightTheme();

  static ThemeData darkTheme = _buildDarkTheme();

  static ThemeData _buildLightTheme() {
    final base = ThemeData.light(useMaterial3: true);
    return _buildTheme(base, _lightScheme());
  }

  static ThemeData _buildDarkTheme() {
    final base = ThemeData.dark(useMaterial3: true);
    return _buildTheme(base, _darkScheme());
  }

  static ThemeData _buildTheme(ThemeData base, ColorScheme colorScheme) {
    final textTheme = _createTextTheme(base);

    return base.copyWith(
      textTheme: textTheme,
      colorScheme: colorScheme,
      actionIconTheme: ActionIconThemeData(
        backButtonIconBuilder: (BuildContext context) => Icon(Icons.arrow_back),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: colorScheme.surfaceContainer,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kWidgetBorderRadius),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kWidgetBorderRadius),
          borderSide: BorderSide(color: colorScheme.surfaceContainer),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kWidgetBorderRadius),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kWidgetBorderRadius),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kWidgetBorderRadius),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kWidgetBorderRadius),
          ),
          minimumSize: const Size(double.infinity, kButtonHeight),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kWidgetBorderRadius),
          ),
          minimumSize: const Size(double.infinity, kButtonHeight),
          textStyle: textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surfaceContainer,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurface,
      ),
    );
  }

  static ColorScheme _lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004cff),
      surfaceTint: Color(0xff0048f4),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004cff),
      onPrimaryContainer: Color(0xffd9deff),
      secondary: Color(0xff4559aa),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff93a6fe),
      onSecondaryContainer: Color(0xff233889),
      tertiary: Color(0xff7e009f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff9f1fc4),
      onTertiaryContainer: Color(0xfffad2ff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffbf8ff),
      onSurface: Color(0xff191b25),
      onSurfaceVariant: Color(0xff434656),
      outline: Color(0xff747688),
      outlineVariant: Color(0xffc3c5d9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e303a),
      inversePrimary: Color(0xffb8c4ff),
      primaryFixed: Color(0xffdde1ff),
      onPrimaryFixed: Color(0xff001355),
      primaryFixedDim: Color(0xffb8c4ff),
      onPrimaryFixedVariant: Color(0xff0036bc),
      secondaryFixed: Color(0xffdde1ff),
      onSecondaryFixed: Color(0xff001355),
      secondaryFixedDim: Color(0xffb8c4ff),
      onSecondaryFixedVariant: Color(0xff2c4091),
      tertiaryFixed: Color(0xfffcd7ff),
      onTertiaryFixed: Color(0xff340043),
      tertiaryFixedDim: Color(0xfff2afff),
      onTertiaryFixedVariant: Color(0xff780098),
      surfaceDim: Color(0xffd9d9e7),
      surfaceBright: Color(0xfffbf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f2ff),
      surfaceContainer: Color(0xffededfb),
      surfaceContainerHigh: Color(0xffe7e7f5),
      surfaceContainerHighest: Color(0xffe1e1ef),
    );
  }

  static ColorScheme _darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff004cff),
      surfaceTint: Color(0xffb8c4ff),
      onPrimary: Color(0xff002486),
      primaryContainer: Color(0xff004cff),
      onPrimaryContainer: Color(0xffd9deff),
      secondary: Color(0xffb8c4ff),
      onSecondary: Color(0xff10287a),
      secondaryContainer: Color(0xff2c4091),
      onSecondaryContainer: Color(0xffa1b1ff),
      tertiary: Color(0xfff2afff),
      onTertiary: Color(0xff55006c),
      tertiaryContainer: Color(0xff9f1fc4),
      onTertiaryContainer: Color(0xfffad2ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff11131c),
      onSurface: Color(0xffe1e1ef),
      onSurfaceVariant: Color(0xffc3c5d9),
      outline: Color(0xff8d90a3),
      outlineVariant: Color(0xff434656),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e1ef),
      inversePrimary: Color(0xff0048f4),
      primaryFixed: Color(0xffdde1ff),
      onPrimaryFixed: Color(0xff001355),
      primaryFixedDim: Color(0xffb8c4ff),
      onPrimaryFixedVariant: Color(0xff0036bc),
      secondaryFixed: Color(0xffdde1ff),
      onSecondaryFixed: Color(0xff001355),
      secondaryFixedDim: Color(0xffb8c4ff),
      onSecondaryFixedVariant: Color(0xff2c4091),
      tertiaryFixed: Color(0xfffcd7ff),
      onTertiaryFixed: Color(0xff340043),
      tertiaryFixedDim: Color(0xfff2afff),
      onTertiaryFixedVariant: Color(0xff780098),
      surfaceDim: Color(0xff11131c),
      surfaceBright: Color(0xff373943),
      surfaceContainerLowest: Color(0xff0c0e17),
      surfaceContainerLow: Color(0xff191b25),
      surfaceContainer: Color(0xff1d1f29),
      surfaceContainerHigh: Color(0xff282934),
      surfaceContainerHighest: Color(0xff33343f),
    );
  }

  static TextTheme _createTextTheme(ThemeData base) {
    TextTheme baseTextTheme = base.textTheme;

    return baseTextTheme.copyWith(
      displayLarge: baseTextTheme.displayLarge!.copyWith(
        fontFamily: "Raleway",
        fontSize: 57,
      ),
      displayMedium: baseTextTheme.displayMedium!.copyWith(
        fontFamily: "Raleway",
        fontSize: 52,
      ),
      displaySmall: baseTextTheme.displaySmall!.copyWith(
        fontFamily: "Raleway",
        fontSize: 44,
      ),
      headlineLarge: baseTextTheme.headlineLarge!.copyWith(
        fontFamily: "Raleway",
        fontSize: 32,
      ),
      headlineMedium: baseTextTheme.headlineMedium!.copyWith(
        fontFamily: "Raleway",
        fontSize: 28,
      ),
      headlineSmall: baseTextTheme.headlineSmall!.copyWith(
        fontFamily: "Raleway",
        fontSize: 24,
      ),
      titleLarge: baseTextTheme.titleLarge!.copyWith(
        fontFamily: "Raleway",
        fontSize: 22,
      ),
      titleMedium: baseTextTheme.titleMedium!.copyWith(
        fontFamily: "Raleway",
        fontSize: 16,
      ),
      titleSmall: baseTextTheme.titleSmall!.copyWith(
        fontFamily: "Raleway",
        fontSize: 14,
      ),
      bodyLarge: baseTextTheme.bodyLarge!.copyWith(
        fontFamily: "Nunito",
        fontSize: 16,
      ),
      bodyMedium: baseTextTheme.bodyMedium!.copyWith(
        fontFamily: "Nunito",
        fontSize: 14,
      ),
      bodySmall: baseTextTheme.bodySmall!.copyWith(
        fontFamily: "Nunito",
        fontSize: 12,
      ),
      labelLarge: baseTextTheme.labelLarge!.copyWith(
        fontFamily: "Nunito",
        fontSize: 14,
      ),
      labelMedium: baseTextTheme.labelMedium!.copyWith(
        fontFamily: "Nunito",
        fontSize: 12,
      ),
      labelSmall: baseTextTheme.labelSmall!.copyWith(
        fontFamily: "Nunito",
        fontSize: 11,
      ),
    );
  }
}
