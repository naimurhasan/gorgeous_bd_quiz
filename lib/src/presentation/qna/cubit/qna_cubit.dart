import 'package:equatable/equatable.dart';
import 'package:gorgeous_quiz/src/data/model/question_model.dart';
import 'package:bloc/bloc.dart';
import 'package:gorgeous_quiz/src/presentation/qna/widgets/option_widget.dart'
    show OptionTheme;

part 'qna_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(const QuizState());

  void answerQuestion(String selectedAnswer) {
    if (state.answeredQuestions.length > state.currentIndex) return;

    final correctAnswer = state.questions[state.currentIndex].correctAnswer;
    final isCorrect = selectedAnswer == correctAnswer;
    final point = state.questions[state.currentIndex].score;

    final answeredQuestions = [...state.answeredQuestions, selectedAnswer];
    final score = isCorrect ? state.score + point : state.score;
    final currentIndex = state.currentIndex + 1;

    emit(state.copyWith(
      score: score,
      answeredQuestions: answeredQuestions,
    ));

    Future.delayed(const Duration(seconds: 2), () {
      if (currentIndex < state.questions.length) {
        emit(state.copyWith(currentIndex: currentIndex));
      } else {
        emit(state.copyWith(isFinished: true));
      }
    });
  }

  void resetAnswers() {
    // shuffle options
    List<Question> questions = state.questions;

    List<Question> shuffledOptionedQuestions = [];
    for (var i = 0; i < questions.length; i++) {
      final question = questions[i];
      List<MapEntry<String, String>> ans =
          question.answers?.entries.toList() ?? [];
      ans.shuffle();
      final answers = Map.fromEntries(ans);
      shuffledOptionedQuestions.add(
        question.copyWith(answers: answers),
      );
    }
    emit(QuizState(
      questions: shuffledOptionedQuestions,
      stateChangeTrigger: state.stateChangeTrigger + 1,
    ));
  }

  void setQuestions(List<Question> questions) {
    emit(QuizState(questions: questions));
  }
}
