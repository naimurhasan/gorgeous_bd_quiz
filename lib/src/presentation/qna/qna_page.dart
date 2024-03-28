import 'package:flutter/material.dart';
import 'package:gorgeous_quiz/src/core/utils/constants.dart';
import 'package:gorgeous_quiz/src/presentation/qna/widgets/branding_bar.dart';
import 'package:gorgeous_quiz/src/presentation/qna/widgets/question_widget.dart';
import 'package:gorgeous_quiz/src/presentation/qna/widgets/score_bar.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key,});

  @override
  Widget build(BuildContext context) {
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
}
