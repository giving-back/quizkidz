// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:timeago/timeago.dart' as timeago;

const kUserError = 'Something has gone wrong. Please try again.';

const kGoogleAuthImage = 'images/auth/google.png';
const kAppleAuthImage = 'images/auth/apple.png';
const kWinnersTrophyImage = 'lib/images/quiz/winners_trophy.jpg';
const kWinnersMedalImage = 'lib/images/quiz/winners_medal.png';

const kBlueColor = 0xFF88B5FE;
const kWhiteColor = 0xFFEFF0F7;
const kLightGreyColor = 0xFFF2F7FB;
const kGoldColor = 0xFFFEB661;
const kSilverColor = 0xFFB1B0B0;
const kBronzeColor = 0xFFC39366;
const kGreyBackgroundColor = 0xFFF1F6FF;
const kPinkColor = 0xFFFF7299;

const kAvatarBlue = 0xFF88B5FE;
const kAvatarDarkBlue = 0xFF396FED;
const kAvatarGreen = 0xFF7CE6E6;
const kAvatarDarkGreen = 0xFF00BBC4;
const kAvatarOrange = 0xFFFF9F00;
const kAvatarDarkOrange = 0xFFFF7D25;
const kAvatarExtraDarkOrange = 0xFFF16625;
const kAvatarBrown = 0xFF7F341F;

final numQuestions = [5, 10, 15, 20, 25];

class Avatar {
  final String image;
  final int color;

  Avatar({
    required this.image,
    required this.color,
  });
}

class DateFormatService {
  DateFormatService();

  static String formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    return timeago.format(now.subtract(difference), locale: 'en');
  }
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
