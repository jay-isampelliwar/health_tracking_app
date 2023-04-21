import 'package:flutter/material.dart';

import '../constants/app_alignement.dart';
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
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.darkBlue,
          borderRadius: BorderRadius.circular(
            AppAlignment.borderRadius(size),
          ),
        ),
        child: Align(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
