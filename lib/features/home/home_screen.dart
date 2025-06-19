import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mind_snack/features/crosswords/crosswords_screen.dart';
import 'package:mind_snack/features/maze/maze_screen.dart';
import 'package:mind_snack/features/riddles/riddles_screen.dart';
import 'package:mind_snack/features/sudoku/sudoku_screen.dart';
import 'package:mind_snack/shared/widgets/custom_app_bar.dart';
import 'package:mind_snack/shared/widgets/section_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'mind_snack'.tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            spacing: 20,
            children: [
              SectionContainer(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MazeScreen())),
                text: 'mazes'.tr(),
              ),
              SectionContainer(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RiddlesScreen())),
                text: 'riddles'.tr(),
              ),
              SectionContainer(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SudokuScreen())),
                text: 'sudoku'.tr(),
              ),
              SectionContainer(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CrosswordsScreen())),
                text: 'crosswords'.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
