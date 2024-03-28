import 'package:gorgeous_quiz/src/data/model/question_model.dart';

abstract class QuizRepository {
  Future<List<Question>> getQuizzes();
}