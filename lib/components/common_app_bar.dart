// Flutter imports:
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

// Project imports:
import 'package:quizkidz/util/util.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(kBlueColor),
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              LineIcons.bell,
            ),
          ),
        ),
      ],
    );
  }
}
