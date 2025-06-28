import 'package:flutter/material.dart';
import 'package:maze/maze.dart';
import 'package:mind_snack/shared/widgets/custom_alert_dialog.dart';
import 'package:mind_snack/shared/widgets/custom_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MazeOneScreen extends StatefulWidget {
  const MazeOneScreen({
    super.key,
    required this.title,
    required this.rows,
    required this.columns,
  });
  final String title;
  final int rows;
  final int columns;

  @override
  State<MazeOneScreen> createState() => _MazeOneScreenState();
}

class _MazeOneScreenState extends State<MazeOneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.title),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Maze(
          height: double.infinity,
          player: MazeItem(
              'https://cdn-icons-png.flaticon.com/512/1198/1198091.png',
              ImageType.network),
          columns: widget.columns,
          rows: widget.rows,
          wallThickness: 2.0,
          wallColor: Colors.red,
          loadingWidget: Center(
            child: CircularProgressIndicator(),
          ),
          finish: MazeItem(
              'assets/images/cheese.png',
              ImageType.asset),
          onFinish: () {
            _showMyDialog(context);
          },
        ),
      ),
    );
  }

  void _showMyDialog(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final currentLevel = _getLevelIndex();
    final maxLevel = prefs.getInt('maxLevel') ?? 0;

    if (currentLevel >= maxLevel) {
      await prefs.setInt('maxLevel', currentLevel + 1);
    }
    showDialog(
      context: context,
      builder: (_) => CustomAlertDialog(
        title: "Поздравляем !!!",
        content: "Вы прирожденный сыроед",
        onConfirm: () {
          Navigator.of(context).pop();
        },
        confirmText: "Прикольно",
      ),
    );
  }

  int _getLevelIndex() {
    final regex = RegExp(r'Уровень (\d+)');
    final match = regex.firstMatch(widget.title);
    if (match != null) {
      return int.parse(match.group(1)!) - 1;
    }
    return 0;
  }
}
