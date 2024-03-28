part of 'qna_cubit.dart';

class QuizState extends Equatable {
  final int score;
  final List<String> answeredQuestions;
  final List<Question> questions;
  final int currentIndex;
  final bool isFinished;

  const QuizState({
    this.score = 0,
    this.answeredQuestions = const [],
    this.questions = const [],
    this.currentIndex = 0,
    this.isFinished = false,
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
    );
  }

  @override
  List<Object?> get props => [score, answeredQuestions, questions];
}
