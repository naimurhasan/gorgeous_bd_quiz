import 'package:gorgeous_quiz/src/data/model/question_model.dart';

abstract class QuizRemoteDatastore {
  Future<List<Question>> getQuizzes();
}