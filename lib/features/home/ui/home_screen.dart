import 'dart:math';

import 'package:flutter/material.dart';
import 'package:health_tracking_app/core/constants/color_constant.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';
import 'package:health_tracking_app/core/helper/helper.dart';
import 'package:health_tracking_app/core/widgets/const_size_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.06,
          right: size.width * 0.06,
          top: size.height * 0.08,
          bottom: size.height * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "For today",
                      style: AppTextStyles.text28(bold: true, size: size),
                    ),
                    AppConstSizeBox.constHightSizedBox(size.height * 0.005),
                    Text(
                      "${Helper.getGreeting()}, Jay!",
                      style: AppTextStyles.text18(bold: false, size: size)
                          .copyWith(
                        color: AppColors.grey,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
            AppConstSizeBox.constHightSizedBox(size.height * 0.04),
            SizedBox(
              height: size.height * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.02,
                        vertical: size.height * 0.02,
                      ),
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * 0.01),
                      decoration: BoxDecoration(
                        color: AppColors.darkBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            child: ContainerRow(
                              title: "Walk",
                              color: AppColors.white,
                              second: Image.asset(
                                "lib/assets/images/shoe.png",
                                width: 30,
                                height: 30,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          AppConstSizeBox.constHightSizedBox(
                              size.height * 0.08),
                          SizedBox(
                            child: CustomPaint(
                              foregroundPainter: StepProgressIndicator(
                                step: 7500,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "7549",
                                    style: AppTextStyles.text14(
                                            bold: false, size: size)
                                        .copyWith(
                                      color: AppColors.white,
                                    ),
                                  ),
                                  Text(
                                    "steps",
                                    style: AppTextStyles.text14(
                                            bold: false, size: size)
                                        .copyWith(
                                      color: AppColors.grey.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppConstSizeBox.constWidthSizedBox(size.width * 0.04),
                  Expanded(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * 0.01),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.03,
                            vertical: size.height * 0.02),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ContainerRow(
                                  title: "Water",
                                  color: AppColors.black,
                                  second: Text(
                                    "💧",
                                    style: AppTextStyles.text18(
                                        bold: false, size: size),
                                  )),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "1.55",
                                    style: AppTextStyles.text18(
                                        bold: true, size: size),
                                  ),
                                  Text(
                                    "Liters",
                                    style: AppTextStyles.text18(
                                            bold: true, size: size)
                                        .copyWith(color: AppColors.grey),
                                  )
                                ],
                              )
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppConstSizeBox.constHightSizedBox(size.height * 0.02),
            SizedBox(
              height: size.height * 0.4,
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.413,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.01),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: AppColors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        AppConstSizeBox.constHightSizedBox(size.height * 0.02),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.01),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: AppColors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppConstSizeBox.constWidthSizedBox(size.width * 0.048),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.grey),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ))
                ],
              ),
            ),
            AppConstSizeBox.constHightSizedBox(size.height * 0.04),
            Container(
              height: 5,
              color: Colors.grey.shade200,
            )
          ],
        ),
      ),
    );
  }
}

class ContainerRow extends StatelessWidget {
  String title;
  Widget second;
  Color color;
  ContainerRow({
    required this.title,
    required this.second,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.text18(bold: false, size: size)
              .copyWith(color: color),
        ),
        const Spacer(),
        second
      ],
    );
  }
}

class StepProgressIndicator extends CustomPainter {
  int step;
  StepProgressIndicator({required this.step});
  @override
  void paint(Canvas canvas, Size size) {
    Paint circle = Paint()
      ..strokeWidth = 10
      ..color = AppColors.grey.withOpacity(0.2)
      ..style = PaintingStyle.stroke;

    Offset offset = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(offset, 50, circle);

    Paint arc = Paint()
      ..strokeWidth = 10
      ..color = AppColors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (step / 10000);
    canvas.drawArc(
        Rect.fromCircle(center: offset, radius: 50), 4.8, angle, false, arc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
