import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/custom_snack_alert.dart';
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
            title: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Let players see who you are.";
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
                                CustomSnackAlert.showErrorSnackBar(),
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
