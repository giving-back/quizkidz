import 'package:flutter/material.dart';

const kUserError = 'Something has gone wrong. Please try again.';

const kGoogleAuthImage = 'lib/images/auth/google.png';
const kAppleAuthImage = 'lib/images/auth/apple.png';

const kBlueColor = Color(0xFF88B5FE);
const kWhiteColor = Color(0xFFEFF0F7);

const kAvatarBlue = Color(0xFF88B5FE);
const kAvatarDarkBlue = Color(0xFF396FED);
const kAvatarGreen = Color(0xFF7CE6E6);
const kAvatarDarkGreen = Color(0xFF00BBC4);
const kAvatarOrange = Color(0xFFFF9F00);
const kAvatarDarkOrange = Color(0xFFFF7D25);
const kAvatarExtraDarkOrange = Color(0xFFF16625);
const kAvatarBrown = Color(0xFF7F341F);

class Avatar {
  final String image;
  final Color color;

  Avatar({
    required this.image,
    required this.color,
  });
}

final kAvatarImages = [
  Avatar(
    image: 'lib/images/avatar/avatar-1.png',
    color: kAvatarOrange,
  ),
  Avatar(
    image: 'lib/images/avatar/avatar-2.png',
    color: kAvatarExtraDarkOrange,
  ),
  Avatar(
    image: 'lib/images/avatar/avatar-3.png',
    color: kAvatarGreen,
  ),
  Avatar(
    image: 'lib/images/avatar/avatar-4.png',
    color: kAvatarBrown,
  ),
  Avatar(
    image: 'lib/images/avatar/avatar-5.png',
    color: kAvatarDarkOrange,
  ),
  Avatar(
    image: 'lib/images/avatar/avatar-6.png',
    color: kAvatarGreen,
  ),
  Avatar(
    image: 'lib/images/avatar/avatar-7.png',
    color: kAvatarOrange,
  ),
  Avatar(
    image: 'lib/images/avatar/avatar-8.png',
    color: kAvatarDarkGreen,
  ),
  Avatar(
    image: 'lib/images/avatar/avatar-9.png',
    color: kAvatarBrown,
  ),
  Avatar(
    image: 'lib/images/avatar/avatar-10.png',
    color: kAvatarDarkBlue,
  ),
  Avatar(
    image: 'lib/images/avatar/avatar-11.png',
    color: kAvatarOrange,
  ),
  Avatar(
    image: 'lib/images/avatar/avatar-12.png',
    color: kAvatarGreen,
  ),
  Avatar(
    image: 'lib/images/avatar/avatar-13.png',
    color: kAvatarDarkOrange,
  ),
  Avatar(
    image: 'lib/images/avatar/avatar-14.png',
    color: kAvatarBlue,
  ),
  Avatar(
    image: 'lib/images/avatar/avatar-15.png',
    color: kAvatarDarkBlue,
  ),
  Avatar(
    image: 'lib/images/avatar/avatar-16.png',
    color: kAvatarDarkOrange,
  ),
  Avatar(
    image: 'lib/images/avatar/avatar-17.png',
    color: kAvatarGreen,
  ),
  Avatar(
    image: 'lib/images/avatar/avatar-18.png',
    color: kAvatarBrown,
  ),
  Avatar(
    image: 'lib/images/avatar/avatar-19.png',
    color: kAvatarBlue,
  ),
  Avatar(
    image: 'lib/images/avatar/avatar-20.png',
    color: kAvatarOrange,
  ),
  Avatar(
    image: 'lib/images/avatar/avatar-21.png',
    color: kAvatarDarkGreen,
  ),
];

BoxDecoration decoratedTopBox() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      colors: [
        Color(0xFF7BB1FD),
        Color(0xFF77AAFE),
        Color(0xFF639EFD),
      ],
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(
        50,
      ),
    ),
  );
}
