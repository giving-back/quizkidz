import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/common_app_bar.dart';
import 'package:quizkidz/components/custom_snack_alert.dart';
import 'package:quizkidz/models/app_user.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/util/util.dart';

class NewUserUsernameScreen extends ConsumerWidget {
  final AppUser user;

  const NewUserUsernameScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authServices = ref.watch(authServicesProvider);
    final userNameController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: const CommonAppBar(),
      body: Form(
        key: formKey,
        child: Container(
          color: const Color(kBlueColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 35,
                child: Container(),
              ),
              Expanded(
                flex: 30,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(kWhiteColor),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0),
                        bottomLeft: Radius.circular(40.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              radius: 35,
                              backgroundColor: Color(user.appAvatarColor!),
                              backgroundImage: AssetImage(
                                user.appAvatar!,
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
                                    user.appDisplayName =
                                        userNameController.text;
                                    user.firstTimeUser = false;
                                    authServices.addNewAppUser(user).then(
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
              Expanded(
                flex: 35,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
