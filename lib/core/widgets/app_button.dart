import 'package:flutter/material.dart';

import '../constants/color_constant.dart';

class AppButton extends StatelessWidget {
  AppButton({
    required this.child,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  Widget child;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.07,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(size.width * 0.02),
        ),
        child: Align(
          child: child,
        ),
      ),
    );
  }
}
