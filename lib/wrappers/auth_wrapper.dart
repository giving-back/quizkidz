// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/screen/login_screen.dart';
import 'package:quizkidz/wrappers/user_wrapper.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider);

    return user.when(
      data: (userData) {
        if (userData == null) {
          return const LoginScreen();
        } else {
          return UserWrapper(uid: userData.uid);
        }
      },
      loading: () => const LoadingSpinner(),
      error: (_, __) => const LoginScreen(),
    );
  }
}
