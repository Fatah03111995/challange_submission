import 'package:challange_submission/core/theme/my_color.dart';
import 'package:challange_submission/core/theme/text_styles.dart';
import 'package:challange_submission/core/utility/device_properties.dart';
import 'package:challange_submission/ui/widget/custom_slider.dart';
import 'package:challange_submission/ui/widget/grid_square.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridGame extends StatelessWidget {
  const GridGame({super.key});

  get itemBuilder => null;

  @override
  Widget build(BuildContext context) {
    DeviceProperties deviceProperties = DeviceProperties(context: context);

    return Scaffold(
        backgroundColor: MyColor.dark700,
        body: Stack(
          children: [
            /// NAVBAR
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  LinearProgressIndicator(
                    minHeight: 50.h,
                    value: 90,
                    color: MyColor.blue1,
                  ),
                  Container(
                    color: MyColor.dark900,
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
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.refresh,
                                  color: Colors.white,
                                  size: 35,
                                )),
                          ],
                        ),
                        const Row(
                          children: [
                            Icon(
                              CupertinoIcons.star,
                              color: Colors.red,
                              size: 35,
                            ),
                            Icon(
                              CupertinoIcons.star_fill,
                              color: Colors.green,
                              size: 35,
                            ),
                          ],
                        ),
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
                ],
              ),
            ),

            /// MAIN SECTION
            Container(
              margin: const EdgeInsets.only(top: 130),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '1',
                    style: TextStyles.l.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    width: 20.w,
                    child: const Divider(
                      thickness: 2,
                    ),
                  ),
                  Text(
                    '2',
                    style: TextStyles.l.copyWith(color: Colors.white),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
              ),
            ),

            /// ACTION BUTTON
            Align(
              alignment: const Alignment(0, 0.9),
              child: SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(MyColor.dark800),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Next',
                      style: TextStyles.m.copyWith(color: Colors.white),
                    )),
              ),
            )
          ],
        ));
  }
}
