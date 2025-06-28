import 'package:flutter/material.dart';
import 'package:mind_snack/core/theme/app_color_theme.dart';
import 'package:mind_snack/features/settings/settings_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.showSettings = false,
  });
  final String title;
  final bool showSettings;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorTheme>();
    return AppBar(
      centerTitle: true,
      title: Text(title),
      backgroundColor: colors?.primary,
      actions: [
        showSettings
            ? IconButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => SettingsScreen())),
                icon: Icon(Icons.settings),
              )
            : SizedBox.shrink(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
