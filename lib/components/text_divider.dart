// Flutter imports:
import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final String text;

  const TextDivider({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 2,
            indent: 80,
            endIndent: 5,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 2,
            indent: 5,
            endIndent: 80,
          ),
        ),
      ],
    );
  }
}
