import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/models/app_user.dart';
import 'package:quizkidz/screen/new_user_username_screen.dart';
import 'package:quizkidz/util/util.dart';

class NewUserAvatarScreen extends ConsumerWidget {
  final AppUser user;

  const NewUserAvatarScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: const Color(kBlueColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 30,
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
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: kAvatarImages.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: GestureDetector(
                                onTap: () {
                                  user.appAvatar = kAvatarImages[index].image;
                                  user.appAvatarColor =
                                      kAvatarImages[index].color;

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NewUserUsernameScreen(
                                        user: user,
                                      ),
                                    ),
                                  );
                                },
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundColor:
                                      Color(kAvatarImages[index].color),
                                  backgroundImage: AssetImage(
                                    kAvatarImages[index].image,
                                  ),
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
            flex: 40,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
