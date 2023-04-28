import 'package:flutter/material.dart';
import 'package:health_tracking_app/core/constants/color_constant.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';
import 'package:health_tracking_app/core/widgets/const_size_box.dart';

import '../../../core/helper/helper.dart';
import '../../../core/widgets/app_bottom_navbar.dart';
import '../../../core/widgets/app_custom_app_bar.dart';
import '../../../core/widgets/app_water_container.dart';
import '../../../core/widgets/heart_container.dart';
import '../../achievement/ui/achievement.dart';
import '../../profile/ui/profile.dart';
import '../../stats/ui/stats.dart';
import '../widgets/container_bottom_column.dart';
import '../widgets/container_row.dart';
import '../widgets/square_container.dart';
import '../widgets/step_progress_indicator.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int selectedIndex = 0;
  List<Widget> widgets = [
    const HomePage(),
    const Achievement(),
    const Stats(),
    const Profile(),
  ];

  @override
  void initState() {
    // locator.get<HomeBloc>().add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: appNavigationBar(
        size: size,
        onTabChange: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: widgets[selectedIndex],
    );
  }
}

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
          top: size.height * 0.06,
          bottom: size.height * 0.04,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: "For today",
                subtitle: "${Helper.getGreeting()}, Jay!",
              ),
              AppConstSizeBox.constHightSizedBox(size.height * 0.03),
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
                          color: AppColors.primaryColor,
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
                                  foregroundPainter: StepProgressIndicator(),
                                  child: Column(
                                    children: [
                                      Text(
                                        "3344",
                                        style: AppTextStyles.text14(
                                                bold: false, size: size)
                                            .copyWith(
                                          color: AppColors.white,
                                        ),
                                      ),
                                      Text(
                                        "Steps",
                                        style: AppTextStyles.text14(
                                                bold: false, size: size)
                                            .copyWith(
                                                color:
                                                    AppColors.secondaryColor),
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
                          AppConstSizeBox.constHightSizedBox(
                              size.height * 0.02),
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
                          border: Border.all(
                              width: 1, color: AppColors.secondaryColor),
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
                            const Expanded(child: HeartStats()),
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
      ),
    );
  }
}
