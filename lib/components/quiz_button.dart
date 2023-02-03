// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:quizkidz/util/util.dart';

class QuizButton extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const QuizButton({
    super.key,
    required this.text,
    required this.onTap,
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
      child: Padding(
        padding: const EdgeInsets.only(
          left: 50,
          right: 50,
          top: 30,
          bottom: 30,
        ),
        child: Text(text),
      ),
      onPressed: () {},
    );
  }
}
