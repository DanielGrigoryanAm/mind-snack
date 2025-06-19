import 'package:flutter/material.dart';
import 'package:maze/maze.dart';
import 'package:mind_snack/shared/widgets/custom_app_bar.dart';

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
              'https://cdn-icons-png.flaticon.com/512/1304/1304028.png',
              ImageType.network),
          onFinish: () {
            print('Финиш!');
          },
        ),
      ),
    );
  }
}
