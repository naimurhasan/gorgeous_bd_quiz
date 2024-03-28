import 'package:get_it/get_it.dart';
import 'package:gorgeous_quiz/src/core/network/http_client.dart';
import 'package:gorgeous_quiz/src/data/datastore/quiz_repository_impl.dart';
import 'package:gorgeous_quiz/src/data/datastore/quiz_repository_remote_datastore_impl.dart';
import 'package:gorgeous_quiz/src/domain/quiz_remote_datastore.dart';
import 'package:gorgeous_quiz/src/domain/quiz_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt di = GetIt.instance;

Future<void> initDI() async {
  di.registerSingleton<BaseHttpClient>(BaseHttpClient());

  di.registerLazySingleton<QuizRemoteDatastore>(() => QuizRemoteDatastoreImpl(
        di.get<BaseHttpClient>().client,
      ));

  di.registerLazySingleton<QuizRepository>(() => QuizRepositoryImpl(
        di.get<QuizRemoteDatastore>(),
      ));

  // Setup SharedPreferences
  SharedPreferences pref = await SharedPreferences.getInstance();
  di.registerSingleton<SharedPreferences>(pref);
}
