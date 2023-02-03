import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/custom_snack_alert.dart';
import 'package:quizkidz/providers/auth_provider.dart';

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
              (r) {},
            ),
          ),
      icon: const Icon(Icons.logout),
    );
  }
}
