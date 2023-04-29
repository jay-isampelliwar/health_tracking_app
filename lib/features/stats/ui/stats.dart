import 'package:flutter/material.dart';
import 'package:health_tracking_app/core/constants/color_constant.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';
import 'package:health_tracking_app/core/helper/helper.dart';
import 'package:health_tracking_app/core/widgets/app_custom_app_bar.dart';
import 'package:health_tracking_app/core/widgets/app_water_container.dart';

import '../../../core/widgets/const_size_box.dart';
import '../../home/widgets/square_container.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                title: "Your Activity",
                //!subtitle should change acc to the selected date
                subtitle: "February 7",
              ),
              AppConstSizeBox.constHightSizedBox(size.height * 0.02),
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
                                border: Border.all(
                                    color: AppColors.primaryColor, width: 1),
                                color: AppColors.lightSecondaryColor),
                            child: Align(
                              child: Text(
                                '${index + 3}',
                                style: AppTextStyles.text26(
                                        bold: true, size: size)
                                    .copyWith(color: AppColors.primaryColor),
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
                                    color: AppColors.lightSecondaryColor),
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
              AppConstSizeBox.constHightSizedBox(size.height * 0.02),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.025),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.lightSecondaryColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(size.width * 0.05)),
                height: size.height * 0.27,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Steps",
                      style: AppTextStyles.text18(bold: false, size: size)
                          .copyWith(color: AppColors.secondaryColor),
                    ),
                    Text(
                      "7898",
                      style: TextStyle(
                        fontSize: ((size.width + size.height) / 2) * 0.12,
                        fontFamily: "GilroyBold",
                      ),
                    ),
                    AppConstSizeBox.constHightSizedBox(size.height * 0.002),
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
              AppConstSizeBox.constHightSizedBox(size.height * 0.02),
              Container(
                height: size.height * 0.3,
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.025),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.lightSecondaryColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(size.width * 0.05)),
                child: Row(
                  children: [
                    WaterContainer(
                        val1: (1 -
                            Helper.getWaterValue() -
                            0.05), //!Helper.getWaterValue()
                        val2: (1 - Helper.getWaterValue() - 0.05),
                        water: 16 //! number of glasses,
                        ),
                    AppConstSizeBox.constWidthSizedBox(size.width * 0.04),
                    Expanded(
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.secondaryColor,
                            width: 1,
                          ),
                          borderRadius:
                              BorderRadius.circular(size.width * 0.07),
                        ),
                        child: SquareContainer(
                          title: "BMI",
                          second: Image.asset(
                            "lib/assets/images/bmi.png",
                            width: size.width * 0.06,
                            height: size.width * 0.06,
                            color: AppColors.black,
                          ),
                          subTitle: "metric",
                          value: "21.02",
                          borderColor: Colors.transparent,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
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
              .copyWith(color: AppColors.secondaryColor),
        ),
        Text(
          value,
          style: AppTextStyles.text24(bold: true, size: size),
        )
      ],
    );
  }
}
