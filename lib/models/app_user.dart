class AppUser {
  final String uid;
  final String? email;
  final String? authDisplayName;
  final String? authPhotoURL;

  AppUser({
    required this.uid,
    required this.email,
    required this.authDisplayName,
    required this.authPhotoURL,
  });
}
