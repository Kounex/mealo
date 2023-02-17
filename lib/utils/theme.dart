import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:mealo/utils/styling.dart';

/// Base themes are based on Grey Law with Material 3 on and using
/// Material 3 error colors
class ThemeUtils {
  static ThemeData get baseLight => FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xFFD2600A),
          primaryContainer: Color(0xFFFFDBC8),
          secondary: Color(0xFF1F3339),
          secondaryContainer: Color(0xFF9EC4D4),
          tertiary: Color(0xFF93A0A9),
          tertiaryContainer: Color(0xFFB5CDDB),
          appBarColor: Color(0xffffdbcf),
          error: Color(0xFFD00020),
          errorContainer: Color(0xFFB1384E),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 9,
        appBarOpacity: StylingUtils.kOpacityForBlur,
        tabBarStyle: FlexTabBarStyle.forBackground,
        appBarStyle: FlexAppBarStyle.surface,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          inputDecoratorBorderType: FlexInputBorderType.underline,
          inputDecoratorUnfocusedHasBorder: false,
          navigationBarOpacity: StylingUtils.kOpacityForBlur,
          navigationBarHeight: 55.0,
          bottomNavigationBarOpacity: StylingUtils.kOpacityForBlur,
        ),
        useMaterial3ErrorColors: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      ).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      );

  static ThemeData get baseDark => FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: Color(0xFFDB823F),
          primaryContainer: Color(0xFFC05402),
          secondary: Color(0xFF486A71),
          secondaryContainer: Color(0xFF1F3339),
          tertiary: Color(0xFFAAB4BB),
          tertiaryContainer: Color(0xFF285C71),
          appBarColor: Color(0xffffdbcf),
          error: Color(0xFFD00020),
          errorContainer: Color(0xFFB1384E),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        darkIsTrueBlack: true,
        appBarOpacity: StylingUtils.kOpacityForBlur,
        tabBarStyle: FlexTabBarStyle.forBackground,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          inputDecoratorBorderType: FlexInputBorderType.underline,
          inputDecoratorUnfocusedHasBorder: false,
          navigationBarOpacity: StylingUtils.kOpacityForBlur,
          navigationBarHeight: 55.0,
          bottomNavigationBarOpacity: StylingUtils.kOpacityForBlur,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      ).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      );
}
