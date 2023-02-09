import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/components/selected_text.dart';
import 'package:quizkidz/components/storage_image.dart';
import 'package:quizkidz/providers/state_providers.dart';
import 'package:quizkidz/providers/storage_provider.dart';

class NumQuestionsList extends ConsumerWidget {
  const NumQuestionsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<int> numQuestions = ref.watch(numQuestionsProvider);
    final selectedNumQuestion = ref.watch(numQuestionProvider);

    return ListView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        for (final numQuestion in numQuestions)
          SizedBox(
            height: 110,
            width: 110,
            child: GestureDetector(
              onTap: () =>
                  ref.read(numQuestionProvider.notifier).state = numQuestion,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectedText(
                    text: numQuestion.toString(),
                    selected: selectedNumQuestion == numQuestion,
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }
}