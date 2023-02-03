import 'package:flutter/material.dart';

class UserScoreSummary extends StatelessWidget {
  final AssetImage image;
  final String text;
  final String data;

  const UserScoreSummary({
    super.key,
    required this.image,
    required this.text,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: image,
      ),
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        data,
      ),
    );
  }
}
