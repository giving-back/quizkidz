// Flutter imports:
import 'package:flutter/material.dart';

class GestureIcon extends StatelessWidget {
  final String? imagePath;
  final Function()? onTap;
  const GestureIcon({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(5),
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          imagePath!,
        ),
      ),
    );
  }
}
