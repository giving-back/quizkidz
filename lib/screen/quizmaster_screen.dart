// Flutter imports:
import 'package:flutter/material.dart';
import 'package:quizkidz/components/common_app_bar.dart';

class QuizmasterScreen extends StatelessWidget {
  const QuizmasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(
        showAlert: false,
      ),
      body: Text('Quizmaster'),
    );
  }
}
