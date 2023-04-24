import 'package:flutter/material.dart';
import 'package:health_tracking_app/core/constants/color_constant.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';
import 'package:health_tracking_app/core/widgets/app_custom_app_bar.dart';

import '../../../core/widgets/const_size_box.dart';

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.06,
          right: size.width * 0.06,
          top: size.height * 0.06,
          bottom: size.height * 0.04,
        ),
        child: Column(
          children: [
            const CustomAppBar(),
            AppConstSizeBox.constHightSizedBox(size.height * 0.03),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: size.width * 0.05,
                    width: size.width * 0.05,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                  );
                },
              ),
            ),
            AppConstSizeBox.constHightSizedBox(size.height * 0.03),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.height * 0.025),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.darkBlue,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(16)),
              height: size.height * 0.28,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Steps",
                    style: AppTextStyles.text18(bold: false, size: size)
                        .copyWith(color: AppColors.grey),
                  ),
                  const Text(
                    "7898",
                    style: TextStyle(
                      fontSize: 88,
                      fontFamily: "GilroyBold",
                    ),
                  ),
                  AppConstSizeBox.constHightSizedBox(size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatsRowColumn(
                        title: "Distance",
                        value: "7562",
                      ),
                      StatsRowColumn(
                        title: "Distance",
                        value: "7562",
                      ),
                      StatsRowColumn(
                        title: "Distance",
                        value: "7562",
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: size.height * 0.3,
            ),
            AppConstSizeBox.constHightSizedBox(size.height * 0.03),
            Container(
              height: 5,
              color: Colors.grey.shade200,
            ),
          ],
        ),
      ),
    );
  }
}

class StatsRowColumn extends StatelessWidget {
  StatsRowColumn({Key? key, required this.title, required this.value})
      : super(key: key);

  String title;
  String value;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.text18(bold: false, size: size)
              .copyWith(color: AppColors.grey),
        ),
        Text(
          value,
          style: AppTextStyles.text24(bold: true, size: size),
        )
      ],
    );
  }
}
