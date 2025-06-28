import 'package:flutter/material.dart';
import 'package:mind_snack/shared/widgets/custom_app_bar.dart';

class RiddlesScreen extends StatelessWidget {
  const RiddlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Загадки'),
      body: Container(),
    );
  }
}
