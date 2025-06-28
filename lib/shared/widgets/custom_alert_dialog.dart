import 'package:flutter/material.dart';
import 'package:mind_snack/core/theme/app_color_theme.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final String? confirmText;
  final String? cancelText;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.onConfirm,
    this.onCancel,
    this.confirmText,
    this.cancelText,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorTheme>();

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(title),
      content: Text(content),
      actions: [
        SizedBox(height: 10),
        if (onCancel != null)
          TextButton(
            onPressed: () {
              if (onCancel != null) onCancel!();
              Navigator.of(context).pop();
            },
            child: Text(cancelText ?? 'Закрыть'),
          ),
        ElevatedButton(
          onPressed: () {
            if (onConfirm != null) onConfirm!();
            Navigator.of(context).pop();
          },
          child: Text(
            confirmText ?? "OK",
            style: TextStyle(color: colors?.text),
          ),
        ),
      ],
    );
  }
}
