import 'package:flutter/material.dart';
import 'package:mind_snack/core/theme/app_color_theme.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.text,
    required this.onTap,
    this.blocking,
  });
  final String text;
  final VoidCallback onTap;
  final bool? blocking;

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
        child: Stack(
          children: [
            Center(
              child: Text(
                style: TextStyle(
                  fontSize: 30,
                ),
                text,
              ),
            ),
            if (blocking ?? false)
              Positioned(
                right: 10,
                top: 10,
                child: Icon(Icons.lock),
              ),
          ],
        ),
      ),
    );
  }
}
