import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorgeous_quiz/src/core/utils/constants.dart';

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
              const Text('High Score: 0'),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(Routes.quiz);
                },
                child: const Text('Start Quiz'),
              ),
            ],
          ),
        ));
  }
}
