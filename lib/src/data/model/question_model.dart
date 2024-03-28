import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
abstract class Question with _$Question {
  factory Question({
    required String question,
    required Map<String, String>? answers,
    String? questionImageUrl,
    required String correctAnswer,
    required int score,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

