// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/change_avatar.dart';
import 'package:quizkidz/components/custom_snack_alert.dart';
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/components/quiz_button.dart';
import 'package:quizkidz/components/signout_button.dart';

// Project imports:
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/util/util.dart';

class ProfileScreen extends ConsumerWidget {
  final String uid;

  const ProfileScreen({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.watch(appUserByIdProvider(uid));
    final authServices = ref.watch(authServicesProvider);
    final userNameController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return appUser.when(
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ChangeAvatar(
                    uid: data!.uid,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                      children: [
                        TextSpan(
                          text: data.appDisplayName,
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                      child: SizedBox(
                                        height: 180,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Form(
                                            key: formKey,
                                            child: Card(
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: TextFormField(
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return "Let players see who you are.";
                                                        }
                                                        return null;
                                                      },
                                                      controller:
                                                          userNameController,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            UnderlineInputBorder(),
                                                        labelText:
                                                            'Choose a Username',
                                                        prefixIcon: Icon(Icons
                                                            .verified_user_outlined),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      TextButton(
                                                        child: const Text(
                                                          'Go',
                                                          style: TextStyle(
                                                            color: Color(
                                                                kBlueColor),
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          if (formKey
                                                              .currentState!
                                                              .validate()) {
                                                            data.appDisplayName =
                                                                userNameController
                                                                    .text;
                                                            authServices
                                                                .addNewAppUser(
                                                                    data)
                                                                .then(
                                                                  (value) =>
                                                                      value
                                                                          .match(
                                                                    (error) => ScaffoldMessenger.of(
                                                                        context)
                                                                      ..hideCurrentSnackBar()
                                                                      ..showSnackBar(
                                                                        CustomSnackAlert
                                                                            .showErrorSnackBar(),
                                                                      ),
                                                                    (r) => Navigator
                                                                        .pop(
                                                                            context),
                                                                  ),
                                                                );
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
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
                const SignoutButton(),
              ],
            ),
          ),
        ],
      ),
      error: (error, stackTrace) => const Text('error'),
      loading: () => const LoadingSpinner(),
    );
  }
}
