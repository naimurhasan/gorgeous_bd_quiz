import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gorgeous_quiz/src/data/model/question_model.dart';
import 'package:gorgeous_quiz/src/domain/quiz_repository.dart';


part 'splash_state.dart';
part 'splash_cubit.freezed.dart';


class SplashCubit extends Cubit<SplashState> {
  final QuizRepository _quizRepository;
  SplashCubit(this._quizRepository) : super(const SplashState.initial());

  void load() async {
    emit(const SplashState.loading());

    try {
      final questions = await _quizRepository.getQuizzes();
      print("LOADER GOT QUESTIONS: $questions");
      emit(SplashState.loaded(questions: questions));
    } catch (e) {
      emit(SplashState.error("Failed to load data: $e"));
    }
  }
}