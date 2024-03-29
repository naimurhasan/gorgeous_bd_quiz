import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gorgeous_quiz/src/core/utils/constants.dart';
import 'package:gorgeous_quiz/src/presentation/menu/cubit/highscore_cubit.dart';
import 'package:gorgeous_quiz/src/presentation/qna/cubit/qna_cubit.dart';
import 'package:gorgeous_quiz/src/presentation/qna/widgets/branding_bar.dart';
import 'package:gorgeous_quiz/src/presentation/qna/widgets/question_widget.dart';
import 'package:gorgeous_quiz/src/presentation/qna/widgets/score_bar.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (context, state) {
        if (state.isFinished) {
          context.read<HighScoreCubit>().setHighScore(state.score);
          context.pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).viewPadding.top,
              ),
              const BrandingBar(),
              const ScoreBar(),
              // page body
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(AppSizes.padding),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                  ),
                  child: const SingleChildScrollView(
                    child: SizedBox(
                      width: double.infinity,
                      child: QuestionWidget(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
