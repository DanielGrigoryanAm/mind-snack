import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mind_snack/features/maze/mazes/maze_one_screen.dart';
import 'package:mind_snack/shared/widgets/custom_alert_dialog.dart';
import 'package:mind_snack/shared/widgets/custom_app_bar.dart';
import 'package:mind_snack/shared/widgets/section_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MazeScreen extends StatefulWidget {
  const MazeScreen({super.key});

  @override
  State<MazeScreen> createState() => _MazeScreenState();
}

class _MazeScreenState extends State<MazeScreen> {
  int maxLevel = 0;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      maxLevel = prefs.getInt('maxLevel') ?? 0;
    });
  }

  List<Map<String, dynamic>> mizeParams = [
    {'title': 'Уровень 1', 'rows': 10, 'columns': 5},
    {'title': 'Уровень 2', 'rows': 15, 'columns': 7},
    {'title': 'Уровень 3', 'rows': 20, 'columns': 10},
    {'title': 'Уровень 4', 'rows': 25, 'columns': 12},
    {'title': 'Уровень 5', 'rows': 30, 'columns': 15},
    {'title': 'Уровень 6', 'rows': 35, 'columns': 18},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'mazes'.tr(),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: mizeParams.length,
              itemBuilder: (BuildContext context, int index) {
                final bool isBlocked = index > maxLevel;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SectionContainer(
                    blocking: isBlocked,
                    text: mizeParams[index]['title'],
                    onTap: () {
                      if (isBlocked) {
                        _showMyDialog(context);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MazeOneScreen(
                              title: mizeParams[index]['title'],
                              columns: mizeParams[index]['columns'],
                              rows: mizeParams[index]['rows'],
                            ),
                          ),
                        ).then((_) => _loadProgress());
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showMyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => CustomAlertDialog(
        title: "Эй не гони лошадей",
        content: "Сначало пройди передедущий уровень",
        confirmText: "Ля ты крыса",
      ),
    );
  }
}
