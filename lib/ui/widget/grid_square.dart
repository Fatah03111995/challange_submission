import 'package:challange_submission/core/bloc/quiz/quiz_bloc.dart';
import 'package:challange_submission/core/bloc/quiz/quiz_event.dart';
import 'package:challange_submission/core/bloc/quiz/quiz_state.dart';
import 'package:challange_submission/core/bloc/slider/slider_cubit.dart';
import 'package:challange_submission/core/bloc/slider/slider_state.dart';
import 'package:challange_submission/core/theme/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridSquare extends StatefulWidget {
  final double width;
  final double height;
  const GridSquare({super.key, required this.width, required this.height});

  @override
  State<GridSquare> createState() => _GridSquareState();
}

class _GridSquareState extends State<GridSquare> {
  List<int> selectedItem = [];

  void toggleSelection(int index) {
    if (selectedItem.contains(index)) {
      selectedItem.remove(index);
    } else {
      selectedItem.add(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: BlocBuilder<SliderCubit, SliderState>(
        builder: (context, sliderState) {
          final crossAxisCount = sliderState.absis;
          final axisCount = sliderState.ordinat;
          final itemCount = axisCount * crossAxisCount;
          final itemWidth = widget.width / crossAxisCount;
          final itemHeight = widget.height / axisCount;

          return BlocSelector<QuizBloc, QuizState, bool>(
            selector: (state) {
              /// RESPONSE ON RESULT TEST
              if (state is QuizSuccess) {
                return state.result;
              }
              return true;
            },
            builder: (context, quizState) {
              return GridView.builder(
                itemCount: itemCount,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    childAspectRatio: itemWidth / itemHeight),
                itemBuilder: (context, index) {
                  final isSelected = selectedItem.contains(index);
                  return GestureDetector(
                    onTap: () {
                      context.read<QuizBloc>().add(
                          ChangeNominator(newNominator: selectedItem.length));
                      setState(() {
                        toggleSelection(index);
                      });
                    },
                    child: Container(
                      color: isSelected ? MyColor.blue1 : Colors.grey,
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
