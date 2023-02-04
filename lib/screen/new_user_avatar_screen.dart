// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/change_avatar.dart';

// Project imports:
import 'package:quizkidz/components/new_user_layout.dart';
import 'package:quizkidz/models/app_user.dart';
import 'package:quizkidz/screen/new_user_username_screen.dart';
import 'package:quizkidz/util/util.dart';

class NewUserAvatarScreen extends ConsumerWidget {
  final AppUser user;

  const NewUserAvatarScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    return NewUserLayout(
      formKey: formKey,
      items: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Choose your Avatar',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 80,
          child: AvatarListView(
            onTap: (index) {
              user.appAvatar = kAvatarImages[index].image;
              user.appAvatarColor = kAvatarImages[index].color;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewUserUsernameScreen(
                    user: user,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
