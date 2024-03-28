import 'package:gorgeous_quiz/src/data/model/question_model.dart';
import 'package:gorgeous_quiz/src/domain/quiz_remote_datastore.dart';
import 'package:gorgeous_quiz/src/domain/quiz_repository.dart';

class QuizRepositoryImpl implements QuizRepository {
  final QuizRemoteDatastore _quizLocalDatastore;

  QuizRepositoryImpl(this._quizLocalDatastore);

  @override
  Future<List<Question>> getQuizzes() {
    return _quizLocalDatastore.getQuizzes();
  }
}
