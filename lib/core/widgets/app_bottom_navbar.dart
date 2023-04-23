import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:health_tracking_app/core/constants/color_constant.dart';

List<Widget> item = [
  Icon(Icons.home, color: AppColors.darkBlue),
  Icon(Icons.home_repair_service_rounded, color: AppColors.darkBlue),
  Icon(Icons.chat_outlined, color: AppColors.darkBlue),
  Icon(Icons.graphic_eq_rounded, color: AppColors.darkBlue),
  Icon(Icons.person, color: AppColors.darkBlue),
];

CurvedNavigationBar appNavigationBar(Size size) {
  return CurvedNavigationBar(
    items: item,
    animationDuration: const Duration(milliseconds: 200),
    height: size.height * 0.08,
    backgroundColor: Colors.transparent,
    color: AppColors.white,
  );
}
