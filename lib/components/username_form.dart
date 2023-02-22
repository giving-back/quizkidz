// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/custom_snack_alert.dart';
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/models/user.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/util/util.dart';

class UsernameForm extends ConsumerWidget {
  const UsernameForm({
    super.key,
    required this.user,
  });
  final AppUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final userNameController = TextEditingController();
    final authServices = ref.watch(authServicesProvider);
    final activeAppUsers = ref.watch(activeAppUsersProvider);

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 35,
              backgroundColor: Color(user.appAvatarColor),
              backgroundImage: AssetImage(
                user.appAvatar,
              ),
            ),
            title: activeAppUsers.when(
              data: (activeAppUsersList) => TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Let players see who you are.";
                  }

                  if (value.length > 10) {
                    return "Keep it to 10 chars max";
                  }

                  var contain = activeAppUsersList.where(
                      (ctiveAppUser) => ctiveAppUser.appDisplayName == value);

                  if (contain.isNotEmpty) {
                    return "Username already taken.";
                  }

                  return null;
                },
                controller: userNameController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Choose a Username',
                  prefixIcon: Icon(Icons.verified_user_outlined),
                ),
              ),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const LoadingSpinner(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text(
                  'Lets Go!',
                  style: TextStyle(
                    color: Color(kBlueColor),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    user.appDisplayName = userNameController.text;
                    user.firstTimeUser = false;
                    authServices.addNewAppUser(user).then(
                          (value) => value.match(
                            (error) => ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                CustomSnackAlert.showErrorSnackBar(
                                  message: kUserError,
                                ),
                              ),
                            (r) => Navigator.pop(context),
                          ),
                        );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
