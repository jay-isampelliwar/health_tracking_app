import 'package:flutter/material.dart';
import 'package:health_tracking_app/core/constants/color_constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello World",
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 55,
                fontFamily: "GilroyBold",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Hello World",
              style: TextStyle(
                color: AppColors.lightOrange,
                fontSize: 55,
                fontFamily: "GilroyLight",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Hello World",
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 55,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Hello World",
              style: TextStyle(
                color: AppColors.lightGrey,
                fontSize: 55,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
