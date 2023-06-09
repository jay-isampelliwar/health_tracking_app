import 'package:flutter/material.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';
import 'package:health_tracking_app/core/helper/router.dart';
import 'package:health_tracking_app/core/widgets/app_button.dart';
import 'package:health_tracking_app/core/widgets/app_custom_app_bar.dart';
import 'package:health_tracking_app/core/widgets/app_text_field.dart';
import 'package:health_tracking_app/features/home/ui/home_screen.dart';
import 'package:hive/hive.dart';

import '../../../core/constants/color_constant.dart';
import '../../../core/widgets/const_size_box.dart';

class Goal extends StatefulWidget {
  Goal({this.isEdit = false, super.key});
  bool isEdit;
  @override
  State<Goal> createState() => _GoalState();
}

class _GoalState extends State<Goal> {
  TextEditingController stepCountTextEditingController =
      TextEditingController();
  TextEditingController calTextEditingController = TextEditingController();
  TextEditingController waterEditingController = TextEditingController();

  final box = Hive.box("goals");
  final localDatabase = Hive.box("localData");

  @override
  void dispose() {
    stepCountTextEditingController.dispose();
    calTextEditingController.dispose();
    waterEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.06,
            right: size.width * 0.06,
            top: size.height * 0.06,
            bottom: size.height * 0.04,
          ),
          child: Column(
            children: [
              CustomAppBar(
                title: widget.isEdit ? "Edit Goals" : "Add Goals",
                subtitle:
                    widget.isEdit ? "Edit the details" : "Add the details",
                profile: false,
              ),
              AppConstSizeBox.constHightSizedBox(size.height * 0.02),
              GoalBlock(
                stepCountTextEditingController: stepCountTextEditingController,
                title: "Daily Steps",
                hindText: "Number of steps",
              ),
              AppConstSizeBox.constHightSizedBox(size.height * 0.01),
              GoalBlock(
                stepCountTextEditingController: calTextEditingController,
                title: "Calories",
                hindText: "Number of calories",
              ),
              AppConstSizeBox.constHightSizedBox(size.height * 0.01),
              GoalBlock(
                stepCountTextEditingController: waterEditingController,
                title: "Water",
                hindText: "Liters",
              ),
              AppConstSizeBox.constHightSizedBox(size.height * 0.04),
              AppButton(
                child: Text(
                  widget.isEdit ? "Edit" : "Add",
                  style: AppTextStyles.text28(bold: true, size: size)
                      .copyWith(color: AppColors.white),
                ),
                onTap: () {
                  box.put("steps", stepCountTextEditingController.text);
                  box.put("calories", calTextEditingController.text);
                  box.put("water", waterEditingController.text);
                  localDatabase.put("glassWater", 0);
                  routeWithPushReplacement(const MainWidget(), context);
                  stepCountTextEditingController.clear();
                  calTextEditingController.clear();
                  waterEditingController.clear();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GoalBlock extends StatelessWidget {
  const GoalBlock(
      {Key? key,
      required this.stepCountTextEditingController,
      required this.hindText,
      required this.title})
      : super(key: key);

  final TextEditingController stepCountTextEditingController;
  final String title;
  final String hindText;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.text22(bold: true, size: size),
        ),
        AppConstSizeBox.constHightSizedBox(size.height * 0.01),
        AppTextField(
          hintText: hindText,
          inputType: TextInputType.number,
          obscureText: false,
          textEditingController: stepCountTextEditingController,
        )
      ],
    );
  }
}
