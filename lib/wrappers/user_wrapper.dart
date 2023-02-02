// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/models/app_user.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/screen/home_screen.dart';
import 'package:quizkidz/screen/new_user_avatar_screen.dart';

class UserWrapper extends ConsumerWidget {
  final AppUser user;

  const UserWrapper({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.watch(appUserByIdProvider(user.uid));

    if (user.firstTimeUser) {
      appUser.when(
        data: (data) {
          return const HomeScreen();
        },
        error: (error, stackTrace) => Text(
          stackTrace.toString(),
        ),
        loading: () => const LoadingSpinner(),
      );
      return NewUserAvatarScreen(user: user);
    } else {
      return const HomeScreen();
    }
  }
}
