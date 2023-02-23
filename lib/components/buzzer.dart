// Flutter imports:
import 'package:flutter/material.dart';
import 'package:quizkidz/util/util.dart';

class Buzzer extends StatelessWidget {
  const Buzzer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const CircleBorder()),
          padding: MaterialStateProperty.all(const EdgeInsets.all(60)),
          backgroundColor: MaterialStateProperty.all(const Color(kBlueColor)),
        ),
        child: const Text(
          'Buzz!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
