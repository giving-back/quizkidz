// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:quizkidz/util/util.dart';

class AvatarListView extends StatelessWidget {
  final Function(int) onTap;

  const AvatarListView({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: kAvatarImages.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: GestureDetector(
            onTap: () => onTap(index),
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Color(kAvatarImages[index].color),
              backgroundImage: AssetImage(
                kAvatarImages[index].image,
              ),
            ),
          ),
        );
      },
    );
  }
}
