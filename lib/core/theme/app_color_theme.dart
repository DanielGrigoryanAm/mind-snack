import 'package:flutter/material.dart';
import 'package:mind_snack/core/theme/app_color.dart';

class AppColorTheme extends ThemeExtension<AppColorTheme> {
  AppColorTheme({
    required this.primary,
    required this.background,
    required this.text,
  });

  final AppColor primary;
  final AppColor background;
  final AppColor text;

  @override
  AppColorTheme copyWith({
    AppColor? primary,
    AppColor? background,
    AppColor? text,
  }) {
    return AppColorTheme(
      primary: primary ?? this.primary,
      background: background ?? this.background,
      text: text ?? this.text,
    );
  }

  @override
  ThemeExtension<AppColorTheme> lerp(
    ThemeExtension<AppColorTheme>? other,
    double t,
  ) {
    if (other is! AppColorTheme) return this;

    return AppColorTheme(
      primary: primary.lerp(other.primary, t),
      background: background.lerp(other.background, t),
      text: text.lerp(other.text, t),
    );
  }

  static AppColorTheme of(BuildContext context) {
    return Theme.of(context).extension<AppColorTheme>()!;
  }
}