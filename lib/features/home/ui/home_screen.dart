import 'package:flutter/material.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 100,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hello World",
                style: AppTextStyles.text12(
                  bold: false,
                  size: size,
                ),
              ),
              Text(
                "Hello World",
                style: AppTextStyles.text14(
                  bold: false,
                  size: size,
                ),
              ),
              Text(
                "Hello World",
                style: AppTextStyles.text16(
                  bold: false,
                  size: size,
                ),
              ),
              Text(
                "Hello World",
                style: AppTextStyles.text18(
                  bold: false,
                  size: size,
                ),
              ),
              Text(
                "Hello World",
                style: AppTextStyles.text20(
                  bold: false,
                  size: size,
                ),
              ),
              Text(
                "Hello World",
                style: AppTextStyles.text22(
                  bold: false,
                  size: size,
                ),
              ),
              Text(
                "Hello World",
                style: AppTextStyles.text24(
                  bold: false,
                  size: size,
                ),
              ),
              Text(
                "Hello World",
                style: AppTextStyles.text26(
                  bold: false,
                  size: size,
                ),
              ),
              Text(
                "Hello World",
                style: AppTextStyles.text28(
                  bold: false,
                  size: size,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
