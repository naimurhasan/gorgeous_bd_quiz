import 'package:equatable/equatable.dart';
import 'package:gorgeous_quiz/src/data/model/question_model.dart';
import 'package:bloc/bloc.dart';

part 'qna_state.dart';

class QuizCubit extends Cubit<QuizState> {
  
  QuizCubit() : super(const QuizState());

  void answerQuestion(String selectedAnswer) {
    final correctAnswer = state.questions[state.currentIndex].correctAnswer;
    final isCorrect = selectedAnswer == correctAnswer;
    final answeredQuestions = [...state.answeredQuestions, selectedAnswer];
    final score = isCorrect ? state.score + 1 : state.score;
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
    emit(QuizState(questions: state.questions));
  }

  void setQuestions(List<Question> questions) {
    emit(QuizState(questions: questions));
  }
}
