import 'package:flutter/material.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';
import 'package:health_tracking_app/core/helper/router.dart';
import 'package:health_tracking_app/core/widgets/app_button.dart';
import 'package:health_tracking_app/core/widgets/app_custom_app_bar.dart';
import 'package:health_tracking_app/core/widgets/app_text_field.dart';
import 'package:health_tracking_app/features/goal/ui/goal.dart';
import 'package:hive/hive.dart';

import '../../../core/constants/color_constant.dart';
import '../../../core/widgets/const_size_box.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  TextEditingController hightTextEditingController = TextEditingController();

  TextEditingController weightTextEditingController = TextEditingController();

  final box = Hive.box("goals");

  @override
  void dispose() {
    hightTextEditingController.dispose();
    weightTextEditingController.dispose();
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
                title: "BMI",
                subtitle: "Add the details",
                profile: false,
              ),
              AppConstSizeBox.constHightSizedBox(size.height * 0.02),
              BMIBlock(
                stepCountTextEditingController: weightTextEditingController,
                title: "Weight",
                hindText: "In KG",
              ),
              AppConstSizeBox.constHightSizedBox(size.height * 0.01),
              BMIBlock(
                stepCountTextEditingController: hightTextEditingController,
                title: "Height",
                hindText: "In CM",
              ),
              AppConstSizeBox.constHightSizedBox(size.height * 0.04),
              AppButton(
                child: Text(
                  "Add",
                  style: AppTextStyles.text28(bold: true, size: size)
                      .copyWith(color: AppColors.white),
                ),
                onTap: () {
                  box.put("height", hightTextEditingController.text);
                  box.put("weight", weightTextEditingController.text);

                  routeWithPushReplacement(const Goal(), context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BMIBlock extends StatelessWidget {
  const BMIBlock(
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
