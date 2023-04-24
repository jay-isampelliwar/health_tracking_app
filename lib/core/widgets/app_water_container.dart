import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../features/home/ui/home_screen.dart';
import '../constants/color_constant.dart';
import '../constants/text_styles.dart';

class WaterContainer extends StatelessWidget {
  const WaterContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        clipBehavior: Clip.hardEdge,
        // margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.grey),
          borderRadius: BorderRadius.circular(size.width * 0.07),
        ),
        child: Stack(children: [
          WaveWidget(
            config: CustomConfig(
              colors: [
                AppColors.waterColorShade1,
                AppColors.waterColorShade2,
              ],
              durations: [
                10000,
                12000,
              ],
              heightPercentages: [0.55, 0.60],
            ),
            backgroundColor: AppColors.white,
            size: const Size(double.infinity, double.infinity),
            waveAmplitude: 0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.02,
            ),
            child: ContainerRow(
                title: "Water",
                color: AppColors.black,
                second: Text(
                  "💧",
                  style: AppTextStyles.text18(bold: false, size: size),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.175, left: size.width * 0.05),
            child: ContainerBottomColumn(
              title: "liters",
              value: "1.55",
              color: AppColors.white,
            ),
          ),
        ]),
      ),
    );
  }
}
