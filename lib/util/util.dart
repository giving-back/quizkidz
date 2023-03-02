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

const numQuestionsPerQuiz = 20;

final questions = [
  {"q": "Which big cat is the largest?", "a": "Tiger"},
  {"q": "Which is the largest planet in the solar system?", "a": "Jupiter"},
  {
    "q": "In which city did the Olympic games originate?",
    "a": "Athens, Greece"
  },
  {"q": "How many Olympic rings are there?", "a": "Five"},
  {"q": "What is the fastest aquatic animal?", "a": "The Sailfish"},
  {"q": "Are worker bees male or female?", "a": "Female"},
  {"q": "How many Earths can fit inside the sun?", "a": "1.3 Million"},
  {"q": "Which color is an emerald?", "a": "Green"},
  {"q": "Whose nose grew longer every time he lied?", "a": "Pinocchio"},
  {"q": "Which US state is famous for Hollywood?", "a": "California"},
  {"q": "Which type of fish is Nemo?", "a": "A Clownfish"},
  {"q": "Where is the Great Pyramid of Giza located?", "a": "Egypt"},
  {"q": "What do bees consume to make honey?", "a": "Nectar"},
  {"q": "Which dinosaur had 15 horns?", "a": "Kosmoceratops"},
  {"q": "How many legs does a lobster have?", "a": "Ten"},
  {"q": "What colors are the spots on a common ladybug?", "a": "Black"},
  {"q": "How many teeth does an adult human have?", "a": "Thirty-two"},
  {"q": "How many animals are there in the periodic table?", "a": "118"},
  {"q": "Which is the worlds largest ocean?", "a": "Pacific ocean"},
  {
    "q": "Which is the largest internal organ in the human body?",
    "a": "The liver"
  },
  {
    "q": "What is the group of stars called that form an imaginary picture?",
    "a": "Constellation"
  },
  {"q": "How much is the diameter of a basketball hoop?", "a": "18 inches"},
  {"q": "What serves as the base for guacamole?", "a": "Avocado"},
  {
    "q":
        "Which company is the largest chocolate manufacturer in the United States?",
    "a": "Hersheys"
  },
  {"q": "What do bees produce?", "a": "Honey"},
  {"q": "Who wrote Romeo Juliet?", "a": "William Shakespeare"},
  {"q": "What is the name of Harry Potters pet owl?", "a": "Hedwig"},
  {"q": "How many colors are there in a rainbow?", "a": "Seven"},
  {"q": "Name the largest state in America.", "a": "Alaska"},
  {"q": "Which planet is known to have the most gravity?", "a": "Jupiter"},
  {
    "q": "Which is the chemical name for common salt?",
    "a": "Sodium Chloride (NaCl)"
  },
  {"q": "Which was the first country to use paper money?", "a": "China"},
  {
    "q": "Which is the fastest flying bird in the world?",
    "a": "Peregrine Falcon"
  },
  {"q": "What is the princess name in Princess and the Frog?", "a": "Tiana"},
  {"q": "Who was the first Disney princess?", "a": "Snow White"},
  {"q": "Which is the closest star to the Earth?", "a": "The Sun"},
  {"q": "Who invented the telephone?", "a": "Alexander Graham Bell"},
  {
    "q": "From which country did the Statue of Liberty come from?",
    "a": "France"
  },
  {"q": "Which is the largest continent?", "a": "Asia"},
  {"q": "How many Great Lakes are there?", "a": "Five"},
  {"q": "Which school did Harry Potter attend?", "a": "Hogwarts"},
  {"q": "Which animal is Baloo in the Jungle Book?", "a": "A Bear"},
  {
    "q": "Which is the highest-grossing holiday movie of all time?",
    "a": "Home Alone"
  },
  {"q": "What is the name of the longest river in the world?", "a": "The Nile"},
  {"q": "What is a thermometer used for?", "a": "To measure temperature"},
  {"q": "Where do you get sugar from?", "a": "Sugarcane"},
  {"q": "What is the fastest animal?", "a": "Cheetah"},
  {"q": "What will you get if you freeze water?", "a": "Ice"},
  {
    "q": "Where does the president of the United States reside?",
    "a": "The White House"
  },
  {"q": "What is the color of the school bus?", "a": "Yellow"},
  {"q": "What is the color of the stars in the US flag?", "a": "White"},
  {"q": "Name any one of the characters in the movie Frozen.", "a": "Elsa"},
  {"q": "How many days are there in a year?", "a": "365"},
  {"q": "What do the panda’s eat?", "a": "Bamboo"},
  {"q": "Name the painter who painted Mona Lisa.", "a": "Leonardo Da Vinci"},
  {"q": "Raisins originated from which fruit?", "a": "Grapes"},
  {"q": "Name the smallest breed of the dog.", "a": "Chihuahua"},
  {"q": "How many chambers are there in the human heart?", "a": "Four"},
  {"q": "What is the name of the ship that sank in 1912?", "a": "Titanic"},
  {"q": "What is the name of the game played at Wimbledon?", "a": "Tennis"},
  {"q": "Name the animal with the largest eyes?", "a": "Giant Squid"},
  {"q": "How many sides are there in Octagon?", "a": "Eight"},
  {"q": "In how many years Olympics are held?", "a": "Four"},
  {"q": "How many players are there in a netball game?", "a": "Seven"},
  {
    "q": "Name the Disney character who flies sitting on a carpet.",
    "a": "Aladdin"
  },
  {"q": "When is Valentine’s day celebrated?", "a": "14th of February"},
  {
    "q": "Why did Jack and Jill go up the hill?",
    "a": "To fetch a pail of water."
  },
  {"q": "Name the coldest place in the world.", "a": "Antarctica"},
  {"q": "Which is the largest bone on the human body?", "a": "Thigh Bone"},
  {"q": "Name the bird which can mimic humans.", "a": "Parrot"}
];
