import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
              SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(
                  kQuizTypeImages[index].image,
                  fit: BoxFit.scaleDown,
                ),
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
