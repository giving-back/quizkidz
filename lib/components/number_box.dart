// Flutter imports:
import 'package:flutter/material.dart';

class NumberBox extends StatelessWidget {
  final String text;

  const NumberBox({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.0,
      height: 25.0,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
