import 'package:challange_submission/core/bloc/game_prop/game_prop_cubit.dart';
import 'package:challange_submission/core/bloc/game_prop/game_prop_state.dart';
import 'package:challange_submission/core/theme/my_color.dart';
import 'package:challange_submission/core/utility/util_component.dart';
import 'package:challange_submission/ui/widget/life_point.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BlocSelector<GamePropCubit, GamePropState, List<int>>(
        selector: (state) {
          return [state.questionNumber, state.questionCount];
        },
        builder: (context, state) {
          return LinearProgressIndicator(
            minHeight: 40.h,
            value: state[0] / state[1],
            color: MyColor.blue1,
          );
        },
      ),
      Container(
        color: MyColor.dark900,
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.chevron_up,
                      color: Colors.white,
                      size: 35,
                    )),
                BlocSelector<GamePropCubit, GamePropState, int>(
                  selector: (state) {
                    return state.refreshChance;
                  },
                  builder: (context, refreshChance) {
                    return IconButton(
                        onPressed: refreshChance == 0
                            ? null
                            : () {
                                UtilComponent.toastWarning(
                                    'you have ${refreshChance - 1} more chance to refresh');
                                context
                                    .read<GamePropCubit>()
                                    .decreaseState(decreaseRefreshChance: 1);
                                context
                                    .read<GamePropCubit>()
                                    .generateQuestion();
                              },
                        icon: Icon(
                          CupertinoIcons.refresh,
                          color: refreshChance == 0
                              ? Colors.white.withOpacity(0.5)
                              : Colors.white,
                          size: 35,
                        ));
                  },
                ),
              ],
            ),
            const LifePoint(),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.chevron_right,
                  color: Colors.green,
                  size: 35,
                )),
          ],
        ),
      ),
    ]);
  }
}
