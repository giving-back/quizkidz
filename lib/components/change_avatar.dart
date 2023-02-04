// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/custom_snack_alert.dart';
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/util/util.dart';

class ChangeAvatar extends ConsumerWidget {
  final String uid;

  const ChangeAvatar({
    super.key,
    required this.uid,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authServices = ref.watch(authServicesProvider);
    final appUser = ref.watch(appUserByIdProvider(uid));

    return appUser.when(
      data: (data) => Stack(
        children: [
          CircleAvatar(
            radius: 70,
            backgroundColor: Color(
              data!.appAvatarColor,
            ),
            backgroundImage: AssetImage(
              data.appAvatar,
            ),
          ),
          Positioned(
            bottom: 1,
            right: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    50,
                  ),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(2, 4),
                    color: Colors.black.withOpacity(
                      0.3,
                    ),
                    blurRadius: 3,
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: SizedBox(
                            height: 110,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 30,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: AvatarListView(
                                  onTap: (index) {
                                    data.appAvatar = kAvatarImages[index].image;
                                    data.appAvatarColor =
                                        kAvatarImages[index].color;
                                    authServices.addNewAppUser(data).then(
                                          (value) => value.match(
                                            (error) =>
                                                ScaffoldMessenger.of(context)
                                                  ..hideCurrentSnackBar()
                                                  ..showSnackBar(
                                                    CustomSnackAlert
                                                        .showErrorSnackBar(),
                                                  ),
                                            (r) => Navigator.pop(context),
                                          ),
                                        );
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      error: (error, stackTrace) => const Text('error'),
      loading: () => const LoadingSpinner(),
    );
  }
}

class AvatarListView extends StatelessWidget {
  final Function(int) onTap;

  const AvatarListView({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: kAvatarImages.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: GestureDetector(
            onTap: () => onTap(index),
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Color(kAvatarImages[index].color),
              backgroundImage: AssetImage(
                kAvatarImages[index].image,
              ),
            ),
          ),
        );
      },
    );
  }
}
