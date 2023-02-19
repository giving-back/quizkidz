// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/change_avatar.dart';
import 'package:quizkidz/components/custom_snack_alert.dart';
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/components/username_form.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/providers/state_provider.dart';
import 'package:quizkidz/util/util.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeAppUser = ref.watch(activeAppUserProvider);
    final authServices = ref.watch(authServicesProvider);

    return activeAppUser.when(
      data: (data) => Column(
        children: [
          Expanded(
            flex: 20,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.transparent,
                    height: 90,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 105,
                    decoration: const BoxDecoration(
                      color: Color(
                        kBlueColor,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(150),
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: ChangeAvatar(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Center(
              child: Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                  children: [
                    TextSpan(
                      text: data?.appDisplayName,
                    ),
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: SizedBox(
                                    height: 180,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        child: UsernameForm(
                                          user: data!,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProfileTile(
                  icon: const Icon(Icons.auto_graph_outlined),
                  text: 'Stats',
                  onTap: () {},
                ),
                ProfileTile(
                  icon: const Icon(Icons.privacy_tip_outlined),
                  text: 'Privacy',
                  onTap: () {},
                ),
                ProfileTile(
                  icon: const Icon(Icons.help_outline),
                  text: 'Help & Support',
                  onTap: () {},
                ),
                ProfileTile(
                  icon: const Icon(Icons.settings_outlined),
                  text: 'Settings',
                  onTap: () => showModalBottomSheet(
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    context: context,
                    builder: (_) => SizedBox(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 30,
                              right: 30,
                            ),
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                        "Delete Account",
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                      content: const Text(
                                        "Continuing will erase all account data from QuizKidz.",
                                      ),
                                      actions: [
                                        TextButton(
                                            child: const Text("Cancel"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).pop();
                                            }),
                                        TextButton(
                                          child: const Text("Continue"),
                                          onPressed: () {
                                            authServices
                                                .deleteActiveAppUser()
                                                .then(
                                                  (value) => value.match(
                                                    (error) => print(
                                                      error.toString(),
                                                    ),
                                                    (r) => authServices
                                                        .signOut()
                                                        .then(
                                                          (value) =>
                                                              value.match(
                                                            (error) =>
                                                                print('error'),
                                                            (r) {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ),
                                                  ),
                                                );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const ListTile(
                                leading: Icon(
                                  Icons.delete_forever_outlined,
                                  size: 40,
                                  color: Colors.redAccent,
                                ),
                                title: Text(
                                  'Delete Account',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ProfileTile(
                  icon: const Icon(Icons.add_reaction_outlined),
                  text: 'Invite a Friend',
                  onTap: () {},
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 8,
                    bottom: 8,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: const Color(kWhiteColor),
                    child: InkWell(
                      onTap: () async => await authServices.signOut().then(
                            (value) => value.match(
                              (error) => ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  CustomSnackAlert.showErrorSnackBar(),
                                ),
                              (r) {
                                ref.watch(tabIndexProvider.notifier).state =
                                    0; // return home for next login
                              },
                            ),
                          ),
                      child: const ListTile(
                        leading: Icon(Icons.logout),
                        title: Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      error: (error, stackTrace) => const Text('error'),
      loading: () => const LoadingSpinner(),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final Icon icon;
  final String text;
  final Function()? onTap;

  const ProfileTile({
    required this.icon,
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 8,
        bottom: 8,
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: const Color(kWhiteColor),
        child: InkWell(
          onTap: onTap,
          child: ListTile(
            leading: icon,
            title: Text(
              text,
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),
            trailing: const Icon(Icons.chevron_right_sharp),
          ),
        ),
      ),
    );
  }
}
