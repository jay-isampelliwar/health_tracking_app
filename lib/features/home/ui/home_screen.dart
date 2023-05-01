import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_tracking_app/core/constants/color_constant.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';
import 'package:health_tracking_app/core/widgets/const_size_box.dart';
import 'package:health_tracking_app/features/home/widgets/app_dialogBox.dart';
import 'package:health_tracking_app/locator.dart';
import 'package:hive/hive.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/helper/helper.dart';
import '../../../core/widgets/app_bottom_navbar.dart';
import '../../../core/widgets/app_custom_app_bar.dart';
import '../../../core/widgets/app_water_container.dart';
import '../../achievement/ui/achievement.dart';
import '../../profile/ui/profile.dart';
import '../../stats/ui/stats.dart';
import '../bloc/home_bloc.dart';
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
    super.initState();

    //!call all API here || Achievement || Profile || Stats ||
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription<StepCount> _stepCountStreamSubscription;

  double stepCounter = 0;
  int initialSteps = 0;
  final box = Hive.box("stepCounter");
  final localDatabase = Hive.box("localData");
  final goal = Hive.box("goals");

  @override
  void initState() {
    super.initState();
    _setupPedometer();
  }

  void _setupPedometer() async {
    var status = await Permission.activityRecognition.request();
    if (status != PermissionStatus.granted) return;

    _stepCountStreamSubscription =
        Pedometer.stepCountStream.listen((stepCount) {
      initialSteps = stepCount.steps;
    });

    await Future.delayed(const Duration(milliseconds: 300));
    // log(initialSteps.toString());
    locator
        .get<HomeBloc>()
        .add(HomeUpdateEvent(steps: initialSteps, divider: initialSteps + 0.0));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocListener<HomeBloc, HomeState>(
      bloc: locator.get<HomeBloc>(),
      listener: (context, state) {
        if (state is HomeShowWaterDialogBoxState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return dialogBox(
                size: size,
                context: context,
              );
            },
          );
        }
      },
      child: Scaffold(
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
                              BlocBuilder<HomeBloc, HomeState>(
                                bloc: locator.get<HomeBloc>(),
                                builder: (context, state) {
                                  return StreamBuilder<StepCount>(
                                      stream: Pedometer.stepCountStream,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          if (box.get("stepValue") == null ||
                                              box.get("stepValue") == -1) {
                                            box.put("stepValue", initialSteps);
                                            stepCounter = initialSteps + 0.0;
                                          } else {
                                            stepCounter =
                                                box.get("stepValue") + 0.0;
                                          }
                                          locator.get<HomeBloc>().add(
                                              HomeUpdateEvent(
                                                  divider: stepCounter,
                                                  steps: snapshot.data!.steps));
                                          return SizedBox(
                                            child: CustomPaint(
                                              foregroundPainter:
                                                  StepProgressIndicator(
                                                      todaysSteps:
                                                          snapshot.data!.steps %
                                                              stepCounter),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "${Helper.getSteps(snapshot.data!.steps % stepCounter)}",
                                                    style: AppTextStyles.text14(
                                                            bold: false,
                                                            size: size)
                                                        .copyWith(
                                                      color: AppColors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Steps",
                                                    style: AppTextStyles.text14(
                                                            bold: false,
                                                            size: size)
                                                        .copyWith(
                                                            color: AppColors
                                                                .secondaryColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        } else {
                                          return SizedBox(
                                            child: CustomPaint(
                                              foregroundPainter:
                                                  StepProgressIndicator(
                                                todaysSteps: 0,
                                              ),
                                            ),
                                          );
                                        }
                                      });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    AppConstSizeBox.constWidthSizedBox(size.width * 0.04),
                    BlocBuilder<HomeBloc, HomeState>(
                      bloc: locator.get<HomeBloc>(),
                      builder: (context, state) {
                        return WaterContainer(
                          val1: (1 - Helper.getWaterValue()) - 0.05,
                          val2: (1 - Helper.getWaterValue()) - 0.0,
                          water: localDatabase.get("glassWater") ?? 1,
                          onTap: () {
                            locator
                                .get<HomeBloc>()
                                .add(WaterContainerClickedEvent());
                          },
                        );
                      },
                    )
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
                          BlocBuilder<HomeBloc, HomeState>(
                            bloc: locator.get<HomeBloc>(),
                            builder: (context, state) {
                              return SquareContainer(
                                title: "Calories",
                                second: Text(
                                  "🔥",
                                  style: AppTextStyles.text18(
                                      bold: false, size: size),
                                ),
                                subTitle: "kcal",
                                value: state is HomeUpdateState
                                    ? state.calories
                                    : "0.0",
                                borderColor: AppColors.secondaryColor,
                              );
                            },
                          ),
                          AppConstSizeBox.constHightSizedBox(
                              size.height * 0.02),
                          SquareContainer(
                            title: "BMI",
                            second: Image.asset(
                              "lib/assets/images/bmi.png",
                              width: size.width * 0.06,
                              height: size.width * 0.06,
                              color: AppColors.black,
                            ),
                            subTitle: Helper.getBMIValue(
                                goal.get("height"), goal.get("weight")),
                            value: "21.02",
                            borderColor: AppColors.secondaryColor,
                          ),
                        ],
                      ),
                    ),
                    AppConstSizeBox.constWidthSizedBox(size.width * 0.045),
                    SizedBox(
                      width: size.width * 0.413,
                      child: Column(
                        children: [
                          BlocBuilder<HomeBloc, HomeState>(
                            bloc: locator.get<HomeBloc>(),
                            builder: (context, state) {
                              return SquareContainer(
                                title: "Distance",
                                second: Image.asset(
                                  "lib/assets/images/distance.png",
                                  width: size.width * 0.06,
                                  height: size.width * 0.06,
                                  color: AppColors.black,
                                ),
                                subTitle: "km",
                                value: state is HomeUpdateState
                                    ? state.distance
                                    : "0.0",
                                borderColor: AppColors.secondaryColor,
                              );
                            },
                          ),
                          AppConstSizeBox.constHightSizedBox(
                              size.height * 0.02),
                          BlocBuilder<HomeBloc, HomeState>(
                            bloc: locator.get<HomeBloc>(),
                            builder: (context, state) {
                              return SquareContainer(
                                title: "Point",
                                second: const Icon(Icons.score),
                                subTitle: "points",
                                value: state is HomeUpdateState
                                    ? state.points
                                    : "0.0",
                                borderColor: AppColors.secondaryColor,
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
