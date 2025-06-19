import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mind_snack/features/maze/mazes/maze_one_screen.dart';
import 'package:mind_snack/shared/widgets/custom_app_bar.dart';
import 'package:mind_snack/shared/widgets/section_container.dart';

class MazeScreen extends StatelessWidget {
  const MazeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> mizeParams = [
      {'title': 'Уровень 1', 'rows': 10, 'columns': 5},
      {'title': 'Уровень 2', 'rows': 15, 'columns': 7},
      {'title': 'Уровень 3', 'rows': 20, 'columns': 10},
      {'title': 'Уровень 4', 'rows': 25, 'columns': 12},
      {'title': 'Уровень 5', 'rows': 30, 'columns': 15},
      {'title': 'Уровень 6', 'rows': 35, 'columns': 18},
    ];
    return Scaffold(
      appBar: CustomAppBar(
        title: 'mazes'.tr(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: mizeParams.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SectionContainer(
                    text: mizeParams[index]['title'],
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MazeOneScreen(
                          title: mizeParams[index]['title'],
                          columns: mizeParams[index]['columns'],
                          rows: mizeParams[index]['rows'],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
