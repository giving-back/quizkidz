// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:quizkidz/models/user.dart';
import 'package:quizkidz/services/auth_service.dart';

class FriendSearchDelegate extends SearchDelegate {
  final List<AppUser> items;
  final AuthService authService;

  FriendSearchDelegate({
    required this.items,
    required this.authService,
  });

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            }
            query = '';
          },
          icon: const Icon(
            Icons.clear,
          ),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () {
          close(
            context,
            query,
          );
        },
        icon: const Icon(
          Icons.arrow_back,
        ),
      );

  @override
  Widget buildResults(BuildContext context) {
    final List<AppUser> filteredMembers = items
        .where(
          (member) => member.appDisplayName.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return ListView.builder(
      itemCount: filteredMembers.length,
      itemBuilder: ((context, index) => Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 8,
            ),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(
                    filteredMembers[index].appAvatarColor,
                  ),
                  backgroundImage: AssetImage(
                    filteredMembers[index].appAvatar,
                  ),
                ),
                title: Text(
                  filteredMembers[index].appDisplayName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                subtitle: Text(filteredMembers[index].email!),
                trailing: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    authService
                        .addFriend(
                          Friend(
                            details: filteredMembers[index],
                            iRequested: true,
                            matched: false,
                            requested: DateTime.now(),
                            matchedOn: DateTime.now(),
                          ),
                        )
                        .then(
                          (value) => value.match(
                            (l) => print(
                              l.toString(),
                            ),
                            (r) => print('add invite'),
                          ),
                        );
                  },
                ),
              ),
            ),
          )),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) => buildResults(context);
}
