import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:mealo/utils/styling.dart';

/// Base themes are based on Grey Law with Material 3 on and using
/// Material 3 error colors
class ThemeUtils {
  static ThemeData get baseLight => FlexThemeData.light(
        scheme: FlexScheme.greyLaw,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 9,
        appBarOpacity: StylingUtils.kOpacityForBlur,
        tabBarStyle: FlexTabBarStyle.forBackground,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          inputDecoratorBorderType: FlexInputBorderType.underline,
          inputDecoratorUnfocusedHasBorder: false,
          navigationBarOpacity: StylingUtils.kOpacityForBlur,
          navigationBarHeight: 55.0,
        ),
        useMaterial3ErrorColors: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      );

  static ThemeData get baseDark => FlexThemeData.dark(
        scheme: FlexScheme.greyLaw,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        appBarOpacity: StylingUtils.kOpacityForBlur,
        tabBarStyle: FlexTabBarStyle.forBackground,
        swapColors: true,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          inputDecoratorBorderType: FlexInputBorderType.underline,
          inputDecoratorUnfocusedHasBorder: false,
          navigationBarOpacity: StylingUtils.kOpacityForBlur,
          navigationBarHeight: 55.0,
        ),
        useMaterial3ErrorColors: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      );
}
