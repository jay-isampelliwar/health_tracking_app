import 'package:flutter/material.dart';
import 'package:health_tracking_app/core/constants/color_constant.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';
import 'package:health_tracking_app/core/widgets/app_custom_app_bar.dart';
import 'package:health_tracking_app/core/widgets/app_water_container.dart';
import 'package:health_tracking_app/core/widgets/heart_container.dart';

import '../../../core/widgets/const_size_box.dart';

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  int selectedIndex = 0;

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
            CustomAppBar(
              title: "Your Activity",
              //!subtitle should change acc to the selected date
              subtitle: "February 7",
            ),
            AppConstSizeBox.constHightSizedBox(size.height * 0.03),
            SizedBox(
              height: size.height * 0.05,
              child: ListView.builder(
                itemCount: 27,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return index == selectedIndex
                      ? Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.01),
                          height: size.width * 0.15,
                          width: size.width * 0.15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: AppColors.darkBlue, width: 1),
                            color: AppColors.grey,
                          ),
                          child: Align(
                            child: Text(
                              '${index + 3}',
                              style:
                                  AppTextStyles.text26(bold: true, size: size)
                                      .copyWith(color: AppColors.darkBlue),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.01),
                              height: size.width * 0.15,
                              width: size.width * 0.15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.grey,
                              ),
                              child: Align(
                                child: Text(
                                  '${index + 3}',
                                  style: AppTextStyles.text22(
                                      bold: true, size: size),
                                ),
                              )),
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
                    color: AppColors.lightGrey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(size.width * 0.05)),
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
                        title: "Calories",
                        value: "255",
                      ),
                      StatsRowColumn(
                        title: "Points",
                        value: "246",
                      ),
                    ],
                  )
                ],
              ),
            ),
            AppConstSizeBox.constHightSizedBox(size.height * 0.03),
            Container(
              height: size.height * 0.3,
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.height * 0.025),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.lightGrey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(size.width * 0.05)),
              child: Row(
                children: [
                  const WaterContainer(),
                  Expanded(
                      child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.grey,
                        width: 1,
                      ),
                    ),
                    child: Stack(children: const [HeartStats()]),
                  ))
                ],
              ),
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
