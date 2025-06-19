import 'package:flutter/material.dart';
import 'package:mind_snack/shared/widgets/custom_app_bar.dart';
import 'package:sudoku_dart/sudoku_dart.dart';

class SudokuScreen extends StatefulWidget {
  const SudokuScreen({super.key});

  @override
  State<SudokuScreen> createState() => _SudokuScreenState();
}

class _SudokuScreenState extends State<SudokuScreen> {
  late Sudoku sudoku;
  late List<int> puzzle;
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    generateSudoku();
  }

  void generateSudoku() {
    sudoku = Sudoku.generate(Level.easy);
    puzzle = List.from(sudoku.puzzle);
    controllers = List.generate(81, (i) {
      final value = puzzle[i] != -1 ? puzzle[i].toString() : '';
      return TextEditingController(text: value);
    });
    setState(() {});
  }

  bool checkSolution() {
    for (int i = 0; i < 81; i++) {
      final text = controllers[i].text.trim();
      if (text.isEmpty || int.tryParse(text) != sudoku.solution[i]) {
        return false;
      }
    }
    return true;
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controllers.isEmpty) return const CircularProgressIndicator();

    return Scaffold(
      appBar: CustomAppBar(title: 'Судоку'),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    itemCount: 81,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 9,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                    ),
                    itemBuilder: (context, index) {
                      final isEditable = puzzle[index] == -1;
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 217, 217, 217)),
                          color: isEditable
                              ? Colors.white
                              : const Color.fromARGB(255, 225, 253, 255),
                        ),
                        child: TextField(
                          controller: controllers[index],
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          enabled: isEditable,
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                IgnorePointer(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 450,
                          width: 450,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 127, 141, 187)),
                          ),
                          child: Text(''),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final correct = checkSolution();
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(correct ? 'Правильно!' : 'Неправильно'),
                  content: Text(correct
                      ? 'Поздравляем, вы решили судоку!'
                      : 'Некоторые значения неверны.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    )
                  ],
                ),
              );
            },
            child: const Text('Проверить'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
