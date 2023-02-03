// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/custom_snack_alert.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/providers/state_providers.dart';

class SignoutIcon extends ConsumerWidget {
  const SignoutIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServicesProvider);

    return IconButton(
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
      icon: const Icon(Icons.logout),
    );
  }
}
