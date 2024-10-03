import 'package:challange_submission/core/bloc/game_prop/game_prop_cubit.dart';
import 'package:challange_submission/core/bloc/game_prop/game_prop_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LifePoint extends StatelessWidget {
  const LifePoint({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<GamePropCubit, GamePropState, List<int>>(
      selector: (state) {
        return [state.lifePoint, state.lifePointCount];
      },
      builder: (context, listState) {
        return Row(
            children: List.generate(listState[1], (index) {
          if (listState[1] == listState[0]) {
            return const Icon(
              CupertinoIcons.star_fill,
              color: Colors.green,
              size: 35,
            );
          }
          return Icon(
            index < listState[0]
                ? CupertinoIcons.star_fill
                : CupertinoIcons.star,
            color: index < listState[0] ? Colors.green : Colors.red,
            size: 35,
          );
        }));
      },
    );
  }
}
