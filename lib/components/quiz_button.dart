// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:quizkidz/util/util.dart';

class QuizButton extends StatelessWidget {
  final String text;
  final EdgeInsets edgeInsets;
  final Function()? onPressed;

  const QuizButton({
    super.key,
    required this.text,
    required this.edgeInsets,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        elevation: MaterialStateProperty.all<double>(
          10,
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(kBlueColor),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: edgeInsets,
        child: Text(text),
      ),
    );
  }
}
