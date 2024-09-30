import 'package:challange_submission/core/bloc/quiz/quiz_bloc.dart';
import 'package:challange_submission/core/bloc/slider/slider_cubit.dart';
import 'package:challange_submission/ui/pages/home_page.dart';
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
    return const ScreenUtilInit(
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
    );
  }
}
