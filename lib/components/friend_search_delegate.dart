// Flutter imports:
import 'package:flutter/material.dart';
import 'package:quizkidz/models/user.dart';

class FriendSearchDelegate extends SearchDelegate {
  final List<AppUser> items;

  FriendSearchDelegate({
    required this.items,
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
      itemBuilder: ((context, index) => ListTile(
            onTap: () {
              query = items[index].appDisplayName;
              close(
                context,
                query,
              );
            },
            title: Text(
              items[index].appDisplayName,
            ),
          )),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) => buildResults(context);
}
