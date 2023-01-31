// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/user_provider.dart';
import 'package:quizkidz/screen/home_screen.dart';
import 'package:quizkidz/screen/login_screen.dart';
import 'package:quizkidz/screen/new_user_screen.dart';

class UserWrapper extends ConsumerWidget {
  final String uid;

  const UserWrapper({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userExists = ref.watch(doesUserExistProvider(uid));

    return userExists.when(
      data: (value) {
        if (value) {
          return const HomeScreen();
        } else {
          return const NewUserScreen();
        }
      },
      loading: () => const LoadingSpinner(),
      error: (_, __) => const LoginScreen(),
    );
  }
}
