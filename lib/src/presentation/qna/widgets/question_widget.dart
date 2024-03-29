import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorgeous_quiz/src/core/utils/constants.dart';
import 'package:gorgeous_quiz/src/presentation/qna/cubit/qna_cubit.dart';
import 'package:gorgeous_quiz/src/presentation/qna/widgets/option_widget.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<QuizCubit>().state;

    if (state.questions.isEmpty) {
      return const Center(child: Text("Quiz is empty"));
    }

    final question = state.questions[state.currentIndex];

    return Padding(
      padding: const EdgeInsets.all(AppSizes.padding),
      child: Column(
        children: [
          // thumbnail
          if(question.questionImageUrl != null && question.questionImageUrl != "null")
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.borderRadius),
            child: SizedBox(
              width: double.infinity,
              height: 190,
              child: CachedNetworkImage(
                imageUrl: question.questionImageUrl!,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.padding * 2),
          // question
          Text(
            question.question,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSizes.padding * 2),
          // options
          ...(question.answers?.entries
                  .map(
                    (e) => OptionWidget(
                      theme: state.getOptionTheme(e.key),
                      text : e.value,
                      option: e.key,
                    ),
                  )
                  .toList() ??
              <Widget>[]),
        ],
      ),
    );
  }
}
