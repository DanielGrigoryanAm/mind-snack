import 'package:flutter/material.dart';
import 'package:mind_snack/core/theme/app_color.dart';
import 'package:mind_snack/core/theme/app_color_palette.dart';
import 'package:mind_snack/core/theme/app_color_theme.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColorPalette.primaryLight,
    extensions: [
      AppColorTheme(
        primary: AppColor(
          AppColorPalette.mediumLight.toARGB32(),
          pressed: AppColorPalette.primaryDark,
        ),
        background: AppColor(AppColorPalette.primaryLight.toARGB32()),
        text: AppColor(AppColorPalette.textDark.toARGB32()),
      ),
    ],
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColorPalette.primaryDark,
    extensions: [
      AppColorTheme(
        primary: AppColor(
          AppColorPalette.mediumDark.toARGB32(),
          pressed: AppColorPalette.primaryLight,
        ),
        background: AppColor(AppColorPalette.primaryDark.toARGB32()),
        text: AppColor(AppColorPalette.textLight.toARGB32()),
      ),
    ],
  );
}