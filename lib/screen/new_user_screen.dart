import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/util/util.dart';

class NewUserScreen extends ConsumerWidget {
  const NewUserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Container(
        color: kBlueColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 23,
              child: Container(),
            ),
            Expanded(
              flex: 54,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: kWhiteColor,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Choose your Avatar & Username',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 80,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: kAvatarImages.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: CircleAvatar(
                                      radius: 35,
                                      backgroundColor:
                                          kAvatarImages[index].color,
                                      backgroundImage: AssetImage(
                                          kAvatarImages[index].image),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 10.0)),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Let players see who you are.";
                                }
                                return null;
                              },
                              controller: userNameController,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'username',
                                prefixIcon: Icon(Icons.verified_user_outlined),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child: const Text(
                                'Lets Go!',
                                style: TextStyle(
                                    color: kBlueColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  print(userNameController.text);
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
              flex: 23,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
