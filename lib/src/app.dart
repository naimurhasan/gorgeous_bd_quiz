import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorgeous_quiz/src/application/routes/app_routes.dart';
import 'package:gorgeous_quiz/src/presentation/menu/cubit/highscore_cubit.dart';
import 'package:gorgeous_quiz/src/presentation/qna/cubit/qna_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuizCubit>(
          create: (BuildContext context) => QuizCubit(),
        ),
         BlocProvider<HighScoreCubit>(
          create: (BuildContext context) => HighScoreCubit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
