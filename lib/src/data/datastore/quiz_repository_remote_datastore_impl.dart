import 'package:dio/dio.dart';
import 'package:gorgeous_quiz/src/data/model/question_model.dart';
import 'package:gorgeous_quiz/src/data/model/quiz_response.dart';
import 'package:gorgeous_quiz/src/domain/quiz_remote_datastore.dart';

class QuizRemoteDatastoreImpl implements QuizRemoteDatastore {
  final Dio httpClient;
  QuizRemoteDatastoreImpl(this.httpClient);

  @override
  Future<List<Question>> getQuizzes() async {
    final response = await httpClient.get('quiz.json');
    if (response.statusCode == 200) {
      final QuizResponse quizResponse = QuizResponse.fromJson(response.data);
      return quizResponse.questions;
    } else {
      throw Exception('Failed to load quizzes');
    }
  }
}
