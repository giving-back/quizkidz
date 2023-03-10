// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/models/user.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/screen/base_screen.dart';
import 'package:quizkidz/screen/new_user_avatar_screen.dart';

class UserWrapper extends ConsumerWidget {
  final AppUser user;

  const UserWrapper({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeAppUser = ref.watch(activeAppUserProvider);

    if (user.firstTimeUser) {
      activeAppUser.when(
        data: (data) {
          return const BaseScreen();
        },
        error: (error, stackTrace) => Text(
          stackTrace.toString(),
        ),
        loading: () => const LoadingSpinner(),
      );
      return NewUserAvatarScreen(
        user: user,
      );
    } else {
      return const BaseScreen();
    }
  }
}
