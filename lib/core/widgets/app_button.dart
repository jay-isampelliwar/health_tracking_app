import 'package:flutter/material.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';

import '../constants/color_constant.dart';

class AppButton extends StatelessWidget {
  AppButton({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  String title;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.07,
        decoration: BoxDecoration(
          color: AppColors.darkBlue,
          borderRadius: BorderRadius.circular(size.width * 0.02),
        ),
        child: Align(
          child: Text(
            title,
            style: AppTextStyles.text28(bold: true, size: size)
                .copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
