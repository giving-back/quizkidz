// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/components/selected_text.dart';
import 'package:quizkidz/components/storage_image.dart';
import 'package:quizkidz/models/quiz.dart';
import 'package:quizkidz/providers/state_provider.dart';
import 'package:quizkidz/providers/storage_provider.dart';

class SubjectsList extends ConsumerWidget {
  const SubjectsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<QuizType> quizTypes = ref.watch(quizTypesProvider);
    final selectedQuizType = ref.watch(questionTypeProvider);

    return ListView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        for (final quizType in quizTypes)
          SizedBox(
            height: 110,
            width: 110,
            child: GestureDetector(
              onTap: () {
                ref.watch(questionTypeProvider.notifier).state = quizType.text;
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StorageImage(
                    image: quizType.image,
                    size: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                  ),
                  SelectedText(
                    text: quizType.text,
                    selected: selectedQuizType == quizType.text,
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }
}
