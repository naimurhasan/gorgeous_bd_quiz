import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gorgeous_quiz/src/app.dart';
import 'package:gorgeous_quiz/src/di_module.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initDI();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const App());
}
