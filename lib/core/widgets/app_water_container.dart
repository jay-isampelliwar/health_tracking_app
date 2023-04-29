import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../features/home/widgets/container_bottom_column.dart';
import '../../features/home/widgets/container_row.dart';
import '../constants/color_constant.dart';
import '../constants/text_styles.dart';
import '../helper/helper.dart';

class WaterContainer extends StatelessWidget {
  WaterContainer({
    required this.val1,
    required this.val2,
    required this.water,
    this.onTap,
    Key? key,
  }) : super(key: key);

  double val1;
  double val2;
  int water;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.secondaryColor),
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
                heightPercentages: [val1, val2],
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
                value: Helper.getWaterLiter(water),
                color: AppColors.white,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
