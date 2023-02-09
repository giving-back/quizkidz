// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:quizkidz/components/new_user_layout.dart';
import 'package:quizkidz/components/username_form.dart';
import 'package:quizkidz/models/user.dart';

class NewUserUsernameScreen extends StatelessWidget {
  final AppUser user;

  const NewUserUsernameScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewUserLayout(
      item: UsernameForm(
        user: user,
      ),
    );
  }
}
