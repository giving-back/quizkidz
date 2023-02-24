// Flutter imports:
import 'package:flutter/material.dart';
import 'package:quizkidz/util/util.dart';

class NumberBox extends StatelessWidget {
  final String text;

  const NumberBox({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(kGreyBackgroundColor),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          bottom: 8,
          left: 10,
          right: 10,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
