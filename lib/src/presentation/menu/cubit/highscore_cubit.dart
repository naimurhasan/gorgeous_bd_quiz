import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorgeous_quiz/src/core/utils/constants.dart';
import 'package:gorgeous_quiz/src/di_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HighScoreCubit extends Cubit<int> {
  HighScoreCubit() : super(0);

  void setHighScore(int score) {
    if (state < score) {
      emit(score);
      di<SharedPreferences>().setInt(AppStrings.highScore, score);
    }
  }
}