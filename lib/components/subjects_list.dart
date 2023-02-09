import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/storage_image.dart';
import 'package:quizkidz/models/quiz_type.dart';
import 'package:quizkidz/providers/state_providers.dart';

class SubjectsList extends ConsumerWidget {
  const SubjectsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => SizedBox(
        height: 110,
        width: 110,
        child: GestureDetector(
          onTap: () {
            ref.read(questionTypeIndexProvider.notifier).state = index;
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StorageImage(
                image: kQuizTypeImages[index].image,
                size: 50,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
              ),
              Text(
                kQuizTypeImages[index].text,
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(right: 5),
      ),
      itemCount: kQuizTypeImages.length,
    );
  }
}
