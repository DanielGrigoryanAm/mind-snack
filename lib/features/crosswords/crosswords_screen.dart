import 'package:flutter/material.dart';
import 'package:crossword_generator/crossword_generator.dart';
import 'package:mind_snack/shared/widgets/custom_app_bar.dart';

class CrosswordsScreen extends StatefulWidget {
  const CrosswordsScreen({super.key});

  @override
  State<CrosswordsScreen> createState() => _CrosswordsScreenState();
}

class _CrosswordsScreenState extends State<CrosswordsScreen> {
  final List<Map<String, dynamic>> _words = [
    {'answer': 'flutter', 'description': 'Фреймворк для UI'},
    {'answer': 'dart', 'description': 'Язык программирования'},
    {'answer': 'state', 'description': 'То, что изменяется в виджетах'},
    {'answer': 'branch', 'description': 'Структура виджетов'},
    {
      'answer': 'widget',
      'description': 'Основной строительный блок интерфейса'
    },
    {'answer': 'build', 'description': 'Метод для построения UI'},
    {'answer': 'async', 'description': 'Ключевое слово для асинхронного кода'},
    {
      'answer': 'future',
      'description': 'Объект, представляющий результат в будущем'
    },
    {'answer': 'stream', 'description': 'Поток значений с течением времени'},
    {
      'answer': 'scaffold',
      'description': 'Основная структура страницы в Flutter'
    },
    {
      'answer': 'context',
      'description': 'Объект для доступа к данным дерева виджетов'
    },
    {
      'answer': 'hotreload',
      'description': 'Функция быстрого обновления при разработке'
    },
    {'answer': 'layout', 'description': 'Размещение элементов на экране'},
    {
      'answer': 'column',
      'description': 'Виджет для вертикального расположения'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Crosswords',
      ),
      body: CrosswordWidget(
        words: _words,
        onRevealCurrentCellLetter: (f) {
          f;
        },
        onCrosswordCompleted: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Поздравляем!'),
              content: const Text('Вы прошли кроссворд!'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
        style: CrosswordStyle(
          currentCellColor: const Color.fromARGB(255, 175, 230, 255),
          wordHighlightColor: const Color.fromARGB(255, 251, 255, 212),
          wordCompleteColor: const Color.fromARGB(255, 193, 255, 174),
          descriptionButtonStyle: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
      ),
    );
  }
}
