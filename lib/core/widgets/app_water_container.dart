import 'package:flutter/material.dart';

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
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02,
          vertical: size.height * 0.02,
        ),
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.grey),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ContainerRow(
                title: "Water",
                color: AppColors.black,
                second: Text(
                  "💧",
                  style: AppTextStyles.text18(bold: false, size: size),
                )),
            const Spacer(),
            const ContainerBottomColumn(
              title: "liters",
              value: "1.55",
            ),
          ]),
        ),
      ),
    );
  }
}
