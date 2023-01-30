import 'package:flutter/material.dart';

const kUserError = 'Something has gone wrong. Please try again.';

BoxDecoration decoratedTopBox() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      colors: [
        Color(0xFF7BB1FD),
        Color(0xFF77AAFE),
        Color(0xFF639EFD),
      ],
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(
        50,
      ),
    ),
  );
}
