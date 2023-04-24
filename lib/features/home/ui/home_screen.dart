import 'dart:math';

import 'package:flutter/material.dart';
import 'package:health_tracking_app/core/constants/color_constant.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';
import 'package:health_tracking_app/core/widgets/app_bottom_navbar.dart';
import 'package:health_tracking_app/core/widgets/const_size_box.dart';
import 'package:health_tracking_app/features/stats/ui/stats.dart';

import '../../../core/helper/helper.dart';
import '../../../core/widgets/app_custom_app_bar.dart';
import '../../../core/widgets/app_water_container.dart';
import '../../../core/widgets/heart_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: appNavigationBar(size),
      body: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.06,
          right: size.width * 0.06,
          top: size.height * 0.06,
          bottom: size.height * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onDoubleTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Stats()));
              },
              child: CustomAppBar(
                title: "For today",
                subtitle: "${Helper.getGreeting()}, Jay!",
              ),
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ContainerRow(
                              title: "Walk",
                              color: AppColors.white,
                              second: Image.asset(
                                "lib/assets/images/shoe.png",
                                width: size.width * 0.06,
                                height: size.width * 0.06,
                                color: AppColors.white,
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
                  ),
                  AppConstSizeBox.constWidthSizedBox(size.width * 0.04),
                  const WaterContainer(),
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
                        SquareContainer(
                          title: "Calories",
                          second: Text(
                            "🔥",
                            style:
                                AppTextStyles.text18(bold: false, size: size),
                          ),
                          subTitle: "kcal",
                          value: "403.5",
                        ),
                        AppConstSizeBox.constHightSizedBox(size.height * 0.02),
                        SquareContainer(
                          title: "Sleep",
                          second: Text(
                            "🛌🏿",
                            style:
                                AppTextStyles.text18(bold: false, size: size),
                          ),
                          subTitle: "hours",
                          value: "08:47",
                        ),
                      ],
                    ),
                  ),
                  AppConstSizeBox.constWidthSizedBox(size.width * 0.048),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                      ),
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * 0.01),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05,
                            ),
                            child: ContainerRow(
                                title: "Heart",
                                second: Text(
                                  "❤",
                                  style: AppTextStyles.text18(
                                      bold: false, size: size),
                                ),
                                color: AppColors.black),
                          ),
                          const HeartStats(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05,
                            ),
                            child: ContainerBottomColumn(
                              title: "bpm",
                              value: "105",
                              color: AppColors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SquareContainer extends StatelessWidget {
  SquareContainer({
    required this.second,
    required this.title,
    required this.subTitle,
    required this.value,
    Key? key,
  }) : super(key: key);

  String title;
  Widget second;
  String subTitle;
  String value;
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContainerRow(
                title: title,
                second: second,
                color: AppColors.black,
              ),
              const Spacer(),
              ContainerBottomColumn(
                value: value,
                title: subTitle,
                color: AppColors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerBottomColumn extends StatelessWidget {
  const ContainerBottomColumn({
    Key? key,
    required this.value,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String value;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: AppTextStyles.text18(bold: true, size: size)
              .copyWith(color: color),
        ),
        Text(
          title,
          style: AppTextStyles.text18(bold: true, size: size)
              .copyWith(color: AppColors.grey),
        )
      ],
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
      ..strokeWidth = ((size.width + size.height) / 2) * 0.3
      ..color = AppColors.grey.withOpacity(0.2)
      ..style = PaintingStyle.stroke;

    Offset offset = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(offset, ((size.width + size.height) / 2) * 1.3, circle);

    Paint arc = Paint()
      ..strokeWidth = ((size.width + size.height) / 2) * 0.3
      ..color = AppColors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (step / 10000);
    canvas.drawArc(
        Rect.fromCircle(
            center: offset, radius: ((size.width + size.height) / 2) * 1.3),
        4.8,
        angle,
        false,
        arc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
