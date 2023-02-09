// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:quizkidz/util/util.dart';

class SelectedText extends StatelessWidget {
  final String text;
  final bool selected;

  const SelectedText({
    super.key,
    required this.text,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? const Color(kBlueColor) : Colors.black54;

    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
