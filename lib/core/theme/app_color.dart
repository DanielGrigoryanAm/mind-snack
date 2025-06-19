import 'package:flutter/material.dart';

class AppColor extends Color implements WidgetStateProperty<Color> {
  const AppColor(
    super.value, {
    this.hover,
    this.pressed,
    this.disabled,
  });

  final Color? hover;
  final Color? pressed;
  final Color? disabled;

  @override
  Color resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) return disabled ?? this;
    if (states.contains(WidgetState.hovered)) return hover ?? this;
    if (states.contains(WidgetState.pressed)) return pressed ?? this;
    return this;
  }

  AppColor lerp(AppColor other, double t) {
    return AppColor(
      Color.lerp(this, other, t)!.toARGB32(),
      hover: Color.lerp(hover, other.hover, t),
      pressed: Color.lerp(pressed, other.pressed, t),
      disabled: Color.lerp(disabled, other.disabled, t),
    );
  }
}