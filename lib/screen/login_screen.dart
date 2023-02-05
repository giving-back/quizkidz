// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/custom_snack_alert.dart';
import 'package:quizkidz/components/gesture_icon.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/util/util.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServicesProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 15,
            child: Container(),
          ),
          Expanded(
            flex: 30,
            child: Column(
              children: [
                const Text(
                  'Quiz Kidz.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureIcon(
                        onTap: () async =>
                            await authService.signInWithGoogle().then(
                                  (value) => value.match(
                                    (error) => ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(
                                        CustomSnackAlert.showErrorSnackBar(),
                                      ),
                                    (r) {},
                                  ),
                                ),
                        imagePath: kGoogleAuthImage,
                      ),
                      GestureIcon(
                        onTap: () async =>
                            await authService.signInWithApple().then(
                                  (value) => value.match(
                                    (error) => ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(
                                        CustomSnackAlert.showErrorSnackBar(),
                                      ),
                                    (r) {},
                                  ),
                                ),
                        imagePath: kAppleAuthImage,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 50,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
