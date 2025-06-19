import 'package:flutter/material.dart';
import 'package:mind_snack/core/theme/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark;
    return AppBar(
      centerTitle: true,
      title: Text(title),
      actions: [
        Switch(
          value: isDark,
          onChanged: (value) {
            ref.read(themeModeProvider.notifier).toggleTheme(value);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
