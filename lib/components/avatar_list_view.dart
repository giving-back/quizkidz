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
        return TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
            ),
          ),
          onPressed: () => onTap(index),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Color(kAvatarImages[index].color),
            backgroundImage: AssetImage(
              kAvatarImages[index].image,
            ),
          ),
        );
      },
    );
  }
}
