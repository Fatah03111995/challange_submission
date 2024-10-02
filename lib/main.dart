import 'package:challange_submission/core/bloc/game_prop/game_prop_cubit.dart';
import 'package:challange_submission/core/bloc/quiz/quiz_bloc.dart';
import 'package:challange_submission/core/bloc/slider/slider_cubit.dart';
import 'package:challange_submission/ui/pages/grid_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// ALLOWED ORIENTATION
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  /// TRANSPARENT STATUS BAR
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => SliderCubit(),
      ),
      BlocProvider(
        create: (context) => QuizBloc(),
      ),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocProvider(
            create: (context) => GamePropCubit()
              ..startGame(questionCount: 10, refreshChance: 3, lifePoint: 2),
            child: const GridGame(),
          )),
    );
  }
}
