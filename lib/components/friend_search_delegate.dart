// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:quizkidz/components/search_list.dart';

class FriendSearchDelegate extends SearchDelegate {
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
    return SearchList(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) => buildResults(context);
}
