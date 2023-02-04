// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/change_avatar.dart';
import 'package:quizkidz/components/common_app_bar.dart';

// Project imports:
import 'package:quizkidz/models/app_user.dart';
import 'package:quizkidz/screen/new_user_username_screen.dart';
import 'package:quizkidz/util/util.dart';

class NewUserAvatarScreen extends ConsumerWidget {
  final AppUser user;

  const NewUserAvatarScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Container(
        color: const Color(kBlueColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 35,
              child: Container(),
            ),
            Expanded(
              flex: 30,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(kWhiteColor),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                      bottomLeft: Radius.circular(40.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 35,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
