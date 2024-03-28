import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gorgeous_quiz/src/data/model/question_model.dart';

part 'quiz_response.freezed.dart';
part 'quiz_response.g.dart';

@freezed
class QuizResponse with _$QuizResponse {
  factory QuizResponse({
    required List<Question> questions,
  }) = _QuizResponse;

  factory QuizResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizResponseFromJson(json);
}
