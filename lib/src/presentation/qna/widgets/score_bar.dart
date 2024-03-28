import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorgeous_quiz/src/core/utils/constants.dart';
import 'package:gorgeous_quiz/src/presentation/qna/cubit/qna_cubit.dart';

class ScoreBar extends StatelessWidget {
  const ScoreBar({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<QuizCubit>().state;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            "Question ${state.currentIndex+1} of ${state.questions.length}",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.white,
            ),
          ),
          const Spacer(),
          Text(
            "Score: ${state.score}",
             style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
