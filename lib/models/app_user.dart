import 'package:quizkidz/util/util.dart';

class AppUser {
  final String uid;
  final String? email;
  final String? authDisplayName;
  final String? authPhotoURL;
  String? appDisplayName;
  Avatar? appAvatar;

  AppUser({
    required this.uid,
    required this.email,
    required this.authDisplayName,
    required this.authPhotoURL,
  });
}
