import 'package:flutter/material.dart';
import 'package:health_tracking_app/core/constants/color_constant.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';
import 'package:health_tracking_app/core/widgets/app_custom_app_bar.dart';
import 'package:health_tracking_app/core/widgets/const_size_box.dart';

class Achievement extends StatelessWidget {
  const Achievement({Key? key}) : super(key: key);

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
              CustomAppBar(title: "Your Achievements", subtitle: ""),
              AppConstSizeBox.constHightSizedBox(size.height * 0.02),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    AchievementContainer(
                      title: "Steps",
                      value: "11027",
                      date: "12/11/2022",
                    ),
                    AchievementContainer(
                      title: "Calories Burned",
                      value: "271",
                      date: "12/11/2022",
                    ),
                    AchievementContainer(
                      title: "Distance",
                      value: "2428m",
                      date: "12/11/2022",
                    ),
                    AchievementContainer(
                      title: "Point",
                      value: "379",
                      date: "05/12/2022",
                    ),
                    AchievementContainer(
                      title: "Water",
                      value: "3.44l",
                      date: "05/12/2022",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
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
              fontSize: size.width * 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
