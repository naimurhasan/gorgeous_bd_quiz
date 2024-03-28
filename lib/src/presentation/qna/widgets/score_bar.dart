import 'package:flutter/material.dart';
import 'package:gorgeous_quiz/src/core/utils/constants.dart';

class ScoreBar extends StatelessWidget {
  const ScoreBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            "Question 1 of 10",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.white,
            ),
          ),
          const Spacer(),
          Text(
            "Score: 0",
             style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
