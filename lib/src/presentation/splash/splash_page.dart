import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gorgeous_quiz/src/core/utils/constants.dart';
import 'package:gorgeous_quiz/src/presentation/splash/cubit/splash_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..load(),
      child: const SplashPageBody(),
    );
  }
}

class SplashPageBody extends StatelessWidget {
  const SplashPageBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(
      listener: (BuildContext context, SplashState state) {
        if(state is Loaded) {
          context.pushReplacementNamed(Routes.menu);
        }
      },
      builder: (BuildContext context, SplashState state) {
        return Scaffold(
          body: Center(
            child: state.maybeWhen(
              error: (message) => Text('Error: $message'),
              orElse: () => const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Loading...'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
