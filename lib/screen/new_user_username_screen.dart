// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:quizkidz/components/common_app_bar.dart';
import 'package:quizkidz/components/username_form.dart';

// Project imports:
import 'package:quizkidz/models/app_user.dart';
import 'package:quizkidz/util/util.dart';

class NewUserUsernameScreen extends StatelessWidget {
  final AppUser user;

  const NewUserUsernameScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    child: UsernameForm(
                      user: user,
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
