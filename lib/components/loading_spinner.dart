// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitThreeBounce(
        color: Colors.black,
        size: 50.0,
      ),
    );
  }
}
