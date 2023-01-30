// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/screen/home/home_screen.dart';
import 'package:quizkidz/screen/login/login_screen.dart';

class Wrapper extends ConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider);

    return user.when(
      data: (userData) {
        bool isLoggedIn = userData != null;

        if (!isLoggedIn) {
          return const LoginScreen();
        }
        return const HomeScreen();
      },
      loading: () => const LoadingSpinner(),
      error: (e, stack) {
        return const LoginScreen();
      },
    );
  }
}
