import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gorgeous_quiz/src/core/utils/constants.dart';
import 'package:gorgeous_quiz/src/data/model/question_model.dart';
import 'package:gorgeous_quiz/src/di_module.dart';
import 'package:gorgeous_quiz/src/domain/quiz_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';


part 'splash_state.dart';
part 'splash_cubit.freezed.dart';


class SplashCubit extends Cubit<SplashState> {
  final QuizRepository _quizRepository;
  SplashCubit(this._quizRepository) : super(const SplashState.initial());

  void load() async {
    emit(const SplashState.loading());

    try {
      final questions = await _quizRepository.getQuizzes();
      int highScore = di<SharedPreferences>().getInt(AppStrings.highScore) ?? 0;
      emit(SplashState.loaded(questions: questions, highScore: highScore));
    } catch (e) {
      emit(SplashState.error("Failed to load data: $e"));
    }
  }
}