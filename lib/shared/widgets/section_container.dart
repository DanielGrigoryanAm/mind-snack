import 'package:flutter/material.dart';
import 'package:mind_snack/core/theme/app_color_theme.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorTheme>();

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colors?.primary,
        ),
        child: Center(
          child: Text(
            style: TextStyle(
              fontSize: 30,
            ),
            text,
          ),
        ),
      ),
    );
  }
}
