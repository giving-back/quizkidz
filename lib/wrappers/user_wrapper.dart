// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/models/app_user.dart';
import 'package:quizkidz/providers/user_provider.dart';
import 'package:quizkidz/screen/home_screen.dart';
import 'package:quizkidz/screen/login_screen.dart';
import 'package:quizkidz/screen/new_user_avatar_screen.dart';

class UserWrapper extends ConsumerWidget {
  final AppUser user;

  const UserWrapper({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userExists = ref.watch(doesUserExistProvider(user.uid));

    return userExists.when(
      data: (value) {
        if (value) {
          return const HomeScreen();
        } else {
          return NewUserAvatarScreen(user: user);
        }
      },
      loading: () => const LoadingSpinner(),
      error: (_, __) => const LoginScreen(),
    );
  }
}
