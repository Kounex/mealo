import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:mealo/utils/styling.dart';

/// Base themes are based on Grey Law with Material 3 on and using
/// Material 3 error colors
class ThemeUtils {
  static ThemeData get baseLight => FlexThemeData.light(
        scheme: FlexScheme.shark,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 9,
        swapColors: true,
        appBarOpacity: StylingUtils.kOpacityForBlur,
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
        swapLegacyOnMaterial3: true,
      ).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      );

  static ThemeData get baseDark => FlexThemeData.dark(
        scheme: FlexScheme.shark,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        swapColors: true,
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
        useMaterial3ErrorColors: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        swapLegacyOnMaterial3: true,
      ).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      );
}
