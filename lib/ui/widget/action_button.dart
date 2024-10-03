import 'package:challange_submission/core/bloc/game_prop/game_prop_cubit.dart';
import 'package:challange_submission/core/bloc/game_prop/game_prop_state.dart';
import 'package:challange_submission/core/bloc/grid/grid_cubit.dart';
import 'package:challange_submission/core/bloc/quiz/quiz_bloc.dart';
import 'package:challange_submission/core/bloc/quiz/quiz_event.dart';
import 'package:challange_submission/core/bloc/quiz/quiz_state.dart';
import 'package:challange_submission/core/bloc/slider/slider_cubit.dart';
import 'package:challange_submission/core/model/question_model.dart';
import 'package:challange_submission/core/theme/my_color.dart';
import 'package:challange_submission/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 50,
      child: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, quizState) {
          return BlocSelector<GamePropCubit, GamePropState, List<int>>(
            selector: (gamePropState) {
              return [
                gamePropState.questionCount,
                gamePropState.questionNumber,
                gamePropState.lifePoint
              ];
            },
            builder: (context, gamePropState) {
              return ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(MyColor.dark800),
                  ),
                  onPressed: gamePropState[0] == gamePropState[1]

                      ///GAME FINISHED, ASK TO TRY AGAIN ?
                      ? () async {
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: MyColor.blue1,
                                  content: Text(
                                    'Well Done !, You have finished this game. Wanna to Try Again ?',
                                    style: TextStyles.m
                                        .copyWith(color: Colors.white),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          context
                                              .read<GamePropCubit>()
                                              .startGame(
                                                  questionCount: 5,
                                                  refreshChance: 5,
                                                  lifePointCount: 2);
                                          context
                                              .read<QuizBloc>()
                                              .add(Initial());
                                          Navigator.pop(context);
                                          context.read<GridCubit>().initial();
                                        },
                                        child: Text(
                                          'Yes',
                                          style: TextStyles.m
                                              .copyWith(color: Colors.black),
                                        ))
                                  ],
                                );
                              });
                        }
                      : () async {
                          if (quizState is QuizSuccess) {
                            if (quizState.result) {
                              //YOUR ANSWER IS TRUE
                              context.read<QuizBloc>().add(Initial());
                              context.read<SliderCubit>().initial();
                              context.read<GridCubit>().initial();
                              context
                                  .read<GamePropCubit>()
                                  .increaseQuestionNumber();
                              context.read<GamePropCubit>().generateQuestion();
                              return;
                            }

                            //YOUR ANSWER IS FALSE AND YOU DONT HAVE LIFE POINT
                            if (gamePropState[2] == 0) {
                              await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Colors.red.withOpacity(0.7),
                                      content: Text(
                                        'You FAILED. Wanna to Try Again ?',
                                        style: TextStyles.m
                                            .copyWith(color: Colors.white),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              context
                                                  .read<GamePropCubit>()
                                                  .startGame(
                                                      questionCount: 5,
                                                      refreshChance: 5,
                                                      lifePointCount: 2);
                                              context
                                                  .read<QuizBloc>()
                                                  .add(Initial());
                                              Navigator.pop(context);
                                              context
                                                  .read<GridCubit>()
                                                  .initial();
                                            },
                                            child: Text(
                                              'Yes',
                                              style: TextStyles.m.copyWith(
                                                  color: Colors.black),
                                            ))
                                      ],
                                    );
                                  });
                              return;
                            }

                            //YOUR ANSWER IS FALSE BUT YOU STILL HAVE LIFE POINT
                            context.read<GamePropCubit>().decreaseLifePoint();
                            context.read<SliderCubit>().initial();
                            context.read<GridCubit>().initial();
                            context.read<QuizBloc>().add(Initial());
                            return;
                          }

                          //DEFAULT
                          QuestionModel rightAnswer =
                              context.read<GamePropCubit>().state.question!;
                          context
                              .read<QuizBloc>()
                              .add(TestAnswer(rightAnswer: rightAnswer));
                        },
                  child: (quizState is QuizLoading)
                      ? CircularProgressIndicator(color: MyColor.blue1)

                      //QUIZ RESULT RESPONSE
                      : (quizState is QuizSuccess && quizState.result)
                          ? const Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : (quizState is QuizSuccess && !quizState.result)
                              ? const Icon(
                                  Icons.block,
                                  color: Colors.red,
                                )

                              //DEFAULT
                              : Text(
                                  gamePropState[0] == gamePropState[1]
                                      ? 'Finish'
                                      : 'Next',
                                  style: TextStyles.m.copyWith(
                                      color:
                                          gamePropState[0] == gamePropState[1]
                                              ? Colors.blue
                                              : Colors.white),
                                ));
            },
          );
        },
      ),
    );
  }
}
