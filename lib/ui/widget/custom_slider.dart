import 'package:challange_submission/core/bloc/slider/slider_cubit.dart';
import 'package:challange_submission/core/bloc/slider/slider_state.dart';
import 'package:challange_submission/core/theme/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSlider extends StatelessWidget {
  final bool isAbsis;
  const CustomSlider({super.key, required this.isAbsis});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SliderCubit, SliderState, int>(
      selector: (state) {
        if (isAbsis) {
          return state.absis;
        } else {
          return state.ordinat;
        }
      },
      builder: (context, sliderState) {
        return Slider(
            max: 10,
            min: 1,
            divisions: 10,
            activeColor: Colors.transparent,
            inactiveColor: Colors.transparent,
            thumbColor: MyColor.blue1,
            label: '$sliderState',
            value: sliderState.toDouble(),
            onChanged: (newValue) {
              if (isAbsis) {
                context.read<SliderCubit>().changeAbsis(newValue.floor());
              } else {
                context.read<SliderCubit>().changeOrdinat(newValue.floor());
              }
            });
      },
    );
  }
}
