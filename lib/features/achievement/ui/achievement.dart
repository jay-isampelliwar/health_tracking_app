import 'package:flutter/material.dart';
import 'package:health_tracking_app/core/constants/color_constant.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';
import 'package:health_tracking_app/core/widgets/app_custom_app_bar.dart';
import 'package:health_tracking_app/core/widgets/const_size_box.dart';
import 'package:health_tracking_app/features/achievement/model/achievement_model.dart';

class Achievement extends StatelessWidget {
  Achievement({required this.model, super.key});
  AchievementDataModel? model;
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
        child: model!.data == null
            ? Center(
                child: Text(
                  "You Don't have data",
                  style: AppTextStyles.text14(bold: true, size: size),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                children: [
                  CustomAppBar(title: "Your Achievements", subtitle: ""),
                  AppConstSizeBox.constHightSizedBox(size.height * 0.02),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AchievementContainer(
                          title: "Steps",
                          value:
                              model!.data!.highestStepCount!.value.toString(),
                          date: model!.data!.highestStepCount!.date
                              .toIso8601String(),
                        ),
                        AchievementContainer(
                          title: "Calories Burned",
                          value: model!.data!.highestCalorieBurned!.value
                              .toString(),
                          date: model!.data!.highestCalorieBurned!.date
                              .toIso8601String(),
                        ),
                        AchievementContainer(
                          title: "Distance",
                          value: model!.data!.highestDistance!.value.toString(),
                          date: model!.data!.highestDistance!.date
                              .toIso8601String(),
                        ),
                        AchievementContainer(
                          title: "Point",
                          value: model!.data!.highestPoint!.value.toString(),
                          date:
                              model!.data!.highestPoint!.date.toIso8601String(),
                        ),
                        AchievementContainer(
                          title: "Water",
                          value: model!.data!.highestWater!.value.toString(),
                          date:
                              model!.data!.highestWater!.date.toIso8601String(),
                        ),
                      ],
                    ),
                  )
                ],
              )),
      ),
    );
  }
}

class AchievementContainer extends StatelessWidget {
  const AchievementContainer({
    Key? key,
    required this.date,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;
  final String date;
//! Date date;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.12,
      margin: EdgeInsets.only(bottom: size.height * 0.01),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.025,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightSecondaryColor, width: 1),
        borderRadius: BorderRadius.circular(size.width * 0.04),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.text24(bold: true, size: size)),
              AppConstSizeBox.constHightSizedBox(size.height * 0.002),
              Text(date, style: AppTextStyles.text18(bold: false, size: size)),
            ],
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: ((size.width + size.height) / 2) * 0.06,
            ),
          ),
        ],
      ),
    );
  }
}
