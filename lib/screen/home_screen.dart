import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/custom_snack_alert.dart';
import 'package:quizkidz/providers/auth_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServicesProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
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
      ),
    );
  }
}
