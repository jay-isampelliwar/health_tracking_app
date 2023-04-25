import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:health_tracking_app/core/constants/color_constant.dart';

Container appNavigationBar(
    {required Size size, required Function(int) onTabChange}) {
  return Container(
    color: Colors.transparent,
    child: Padding(
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.01, horizontal: size.width * 0.03),
      child: GNav(
        activeColor: AppColors.white,
        color: AppColors.black,
        duration: const Duration(milliseconds: 300),
        tabBackgroundColor: AppColors.primaryColor,
        tabActiveBorder: Border.all(color: AppColors.primaryColor, width: 1),
        onTabChange: onTabChange,
        tabs: [
          GButton(
            icon: Icons.home_outlined,
            padding: EdgeInsets.all(size.width * 0.03),
          ),
          GButton(
            icon: Icons.wallet_giftcard_outlined,
            padding: EdgeInsets.all(size.width * 0.03),
          ),
          GButton(
            icon: Icons.graphic_eq_rounded,
            padding: EdgeInsets.all(size.width * 0.03),
          ),
          GButton(
            icon: Icons.person_outline,
            padding: EdgeInsets.all(size.width * 0.03),
          ),
        ],
      ),
    ),
  );
}
