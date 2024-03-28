import 'package:get_it/get_it.dart';
import 'package:gorgeous_quiz/src/core/network/http_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt di = GetIt.instance;


Future<void> initDI() async {
  di.registerSingleton<BaseHttpClient>(BaseHttpClient());

  // Setup SharedPreferences
  SharedPreferences pref = await SharedPreferences.getInstance();
  di.registerSingleton<SharedPreferences>(pref);
}
