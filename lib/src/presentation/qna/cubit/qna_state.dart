part of 'qna_cubit.dart';

class QuizState extends Equatable {
  final int score;
  final List<String> answeredQuestions;
  final List<Question> questions;
  final int currentIndex;
  final bool isFinished;
  // state change trigger is used to 
  // force state change notify
  // cause nested options shuffling 
  // cant be detect by quizstate equatable
  final int stateChangeTrigger;

  const QuizState({
    this.score = 0,
    this.answeredQuestions = const [],
    this.questions = const [],
    this.currentIndex = 0,
    this.isFinished = false,
    this.stateChangeTrigger = 0,
  });

  QuizState copyWith({
    int? score,
    List<String>? answeredQuestions,
    int? currentIndex,
    bool? isFinished,
  }) {
    return QuizState(
      score: score ?? this.score,
      answeredQuestions: answeredQuestions ?? this.answeredQuestions,
      questions: questions,
      currentIndex: currentIndex ?? this.currentIndex,
      isFinished: isFinished ?? this.isFinished,
      stateChangeTrigger: stateChangeTrigger + 1,
    );
  }

  @override
  List<Object?> get props => [
        score,
        answeredQuestions,
        questions,
        currentIndex,
        isFinished,
        stateChangeTrigger,
      ];

  OptionTheme getOptionTheme(String e) {
    if (answeredQuestions.length > currentIndex) {
      if (e == questions[currentIndex].correctAnswer) {
        return OptionTheme.correct;
      } else if (e == answeredQuestions[currentIndex]) {
        return OptionTheme.incorrect;
      } else {
        return OptionTheme.neutral;
      }
    } else {
      return OptionTheme.neutral;
    }
  }
}
