import 'package:challange_submission/core/bloc/grid/grid_cubit.dart';
import 'package:challange_submission/core/bloc/grid/grid_state.dart';
import 'package:challange_submission/core/bloc/quiz/quiz_bloc.dart';
import 'package:challange_submission/core/bloc/quiz/quiz_event.dart';
import 'package:challange_submission/core/bloc/quiz/quiz_state.dart';
import 'package:challange_submission/core/bloc/slider/slider_cubit.dart';
import 'package:challange_submission/core/bloc/slider/slider_state.dart';
import 'package:challange_submission/core/theme/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridSquare extends StatelessWidget {
  final double width;
  final double height;
  const GridSquare({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: BlocBuilder<SliderCubit, SliderState>(
          builder: (context, sliderState) {
            final crossAxisCount = sliderState.absis;
            final axisCount = sliderState.ordinat;
            final itemCount = axisCount * crossAxisCount;
            final itemWidth = width / crossAxisCount;
            final itemHeight = height / axisCount;

            context
                .read<QuizBloc>()
                .add(ChangeDenominator(newDenominator: itemCount));

            return BlocSelector<QuizBloc, QuizState, bool?>(
              selector: (state) {
                /// RESPONSE ON RESULT TEST
                if (state is QuizSuccess) {
                  return state.result;
                }
                return null;
              },
              builder: (context, quizResult) {
                return BlocBuilder<GridCubit, GridState>(
                  builder: (context, gridState) {
                    context.read<QuizBloc>().add(ChangeNominator(
                        newNominator: gridState.selectedGrid.length));
                    return GridView.builder(
                      itemCount: itemCount,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 2,
                          childAspectRatio: itemWidth / itemHeight),
                      itemBuilder: (context, index) {
                        final isSelected =
                            gridState.selectedGrid.contains(index);
                        return GestureDetector(
                          onTap: () {
                            context.read<GridCubit>().toggleSelection(index);
                          },
                          child: Container(
                              color: quizResult == null
                                  ? isSelected
                                      ? MyColor.blue1
                                      : Colors.grey
                                  : quizResult
                                      ? Colors.green
                                      : Colors.red),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
