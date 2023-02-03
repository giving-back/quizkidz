import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/custom_snack_alert.dart';
import 'package:quizkidz/components/loading_spinner.dart';
import 'package:quizkidz/providers/auth_provider.dart';
import 'package:quizkidz/util/util.dart';

class HomeScreen extends ConsumerWidget {
  final String uid;

  const HomeScreen({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServicesProvider);
    final appUser = ref.watch(appUserByIdProvider(uid));

    return appUser.when(
      data: (data) => Column(
        children: [
          Expanded(
            flex: 35,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(
                  kBlueColor,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(
                        data!.appAvatarColor,
                      ),
                      backgroundImage: AssetImage(
                        data.appAvatar,
                      ),
                    ),
                    title: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Hi ${data.appDisplayName}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    subtitle: const Text(
                      "Let's Play!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(45.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 20,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                      'lib/images/quiz/winners_trophy.jpg'),
                                ),
                                title: const Text(
                                  'Won',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  data.quizWins.toString(),
                                ),
                              ),
                            ),
                            const VerticalDivider(
                              indent: 10,
                              endIndent: 10,
                              thickness: 2,
                            ),
                            Expanded(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                    'lib/images/quiz/winners_medal.png',
                                  ),
                                ),
                                title: const Text(
                                  'Correct',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  data.questionsAnswered.toString(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 65,
            child: IconButton(
              onPressed: () async => await authService.signOut().then(
                    (value) => value.match(
                      (error) => ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          CustomSnackAlert.showErrorSnackBar(),
                        ),
                      (r) {},
                    ),
                  ),
              icon: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      error: (error, stackTrace) => const Text('error'),
      loading: () => const LoadingSpinner(),
    );
  }
}
