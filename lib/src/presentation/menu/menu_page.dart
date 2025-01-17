import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gorgeous_quiz/src/core/utils/constants.dart';
import 'package:gorgeous_quiz/src/presentation/menu/cubit/highscore_cubit.dart';
import 'package:gorgeous_quiz/src/presentation/qna/cubit/qna_cubit.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppConstants.name),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<HighScoreCubit, int>(builder: (context, score) {
                return Text(
                  'High Score: $score',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                );
              }),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  context.read<QuizCubit>().resetAnswers();
                  context.pushNamed(Routes.quiz);
                },
                child: const Text('Start Quiz'),
              ),
            ],
          ),
        ));
  }
}
