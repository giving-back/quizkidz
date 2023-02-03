// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/custom_snack_alert.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/providers/state_providers.dart';
import 'package:quizkidz/util/util.dart';

class SignoutButton extends ConsumerWidget {
  const SignoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServicesProvider);

    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        elevation: MaterialStateProperty.all<double>(
          10,
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(kBlueColor),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
          top: 10,
          bottom: 10,
        ),
        child: Text('Log Out'),
      ),
      onPressed: () async => await authService.signOut().then(
            (value) => value.match(
              (error) => ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  CustomSnackAlert.showErrorSnackBar(),
                ),
              (r) {
                ref.read(tabIndexProvider.notifier).state =
                    0; // return home for next login
              },
            ),
          ),
    );
  }
}
