import 'package:challange_submission/core/bloc/game_prop/game_prop_cubit.dart';
import 'package:challange_submission/core/bloc/game_prop/game_prop_state.dart';
import 'package:challange_submission/core/bloc/quiz/quiz_bloc.dart';
import 'package:challange_submission/core/bloc/quiz/quiz_state.dart';
import 'package:challange_submission/core/model/question_model.dart';
import 'package:challange_submission/core/theme/my_color.dart';
import 'package:challange_submission/core/theme/text_styles.dart';
import 'package:challange_submission/core/utility/device_properties.dart';
import 'package:challange_submission/ui/widget/action_button.dart';
import 'package:challange_submission/ui/widget/custom_slider.dart';
import 'package:challange_submission/ui/widget/grid_square.dart';
import 'package:challange_submission/ui/widget/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridGame extends StatefulWidget {
  const GridGame({super.key});

  @override
  State<GridGame> createState() => _GridGameState();
}

class _GridGameState extends State<GridGame> {
  get itemBuilder => null;

  @override
  void initState() {
    context
        .read<GamePropCubit>()
        .startGame(questionCount: 5, refreshChance: 5, lifePointCount: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DeviceProperties deviceProperties = DeviceProperties(context: context);

    return Scaffold(
        backgroundColor: MyColor.dark700,
        body: Stack(
          children: [
            /// NAVBAR
            const Align(
              alignment: Alignment.topCenter,
              child: NavBar(),
            ),

            /// MAIN SECTION
            Container(
              margin: const EdgeInsets.only(top: 130),
              child: BlocSelector<GamePropCubit, GamePropState, QuestionModel>(
                selector: (state) {
                  return state.question!;
                },
                builder: (context, question) {
                  return BlocSelector<QuizBloc, QuizState, bool?>(
                    selector: (state) {
                      /// RESPONSE ON RESULT TEST
                      if (state is QuizSuccess) {
                        return state.result;
                      }
                      return null;
                    },
                    builder: (context, quizResult) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${question.nominator}',
                            style: TextStyles.l.copyWith(
                                color: quizResult == null
                                    ? Colors.white
                                    : quizResult
                                        ? Colors.green
                                        : Colors.red),
                          ),
                          SizedBox(
                            width: 20.w,
                            child: Divider(
                                thickness: 2,
                                color: quizResult == null
                                    ? Colors.white
                                    : quizResult
                                        ? Colors.green
                                        : Colors.red),
                          ),
                          Text(
                            '${question.denominator}',
                            style: TextStyles.l.copyWith(
                                color: quizResult == null
                                    ? Colors.white
                                    : quizResult
                                        ? Colors.green
                                        : Colors.red),
                          ),
                          const SizedBox(height: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: deviceProperties.width * 0.7,
                                  height: deviceProperties.width * 0.15,
                                  child: const CustomSlider(isAbsis: true)),
                              Row(
                                children: [
                                  SizedBox(
                                    width: deviceProperties.width * 0.15,
                                    height: deviceProperties.width * 0.7,
                                    child: const RotatedBox(
                                        quarterTurns: 1,
                                        child: CustomSlider(isAbsis: false)),
                                  ),
                                  GridSquare(
                                      width: deviceProperties.width * 0.7,
                                      height: deviceProperties.width * 0.7),
                                  SizedBox(
                                    width: deviceProperties.width * 0.15,
                                    height: deviceProperties.width * 0.7,
                                    child: const RotatedBox(
                                        quarterTurns: 1,
                                        child: CustomSlider(isAbsis: false)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  width: deviceProperties.width * 0.7,
                                  height: deviceProperties.width * 0.15,
                                  child: const CustomSlider(isAbsis: true))
                            ],
                          ),
                          const SizedBox(height: 30),
                        ],
                      );
                    },
                  );
                },
              ),
            ),

            /// ACTION BUTTON
            const Align(alignment: Alignment(0, 0.9), child: ActionButton())
          ],
        ));
  }
}
