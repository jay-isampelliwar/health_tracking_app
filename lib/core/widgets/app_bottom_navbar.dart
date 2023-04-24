import 'package:flutter/material.dart';
import 'package:health_tracking_app/core/constants/color_constant.dart';

List<Widget> item = [
  const NavBarItem(
    path: "lib/assets/images/home.png",
  ),
  const NavBarItem(
    path: "lib/assets/images/achievement.png",
  ),
  const NavBarItem(
    path: "lib/assets/images/bot.png",
  ),
  const NavBarItem(
    path: "lib/assets/images/stats.png",
  ),
  const NavBarItem(
    path: "lib/assets/images/profile.png",
  ),
];

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    required this.path,
    Key? key,
  }) : super(key: key);
  final String path;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.08,
      child: Image.asset(
        path,
        color: AppColors.darkBlue,
      ),
    );
  }
}

NavigationBar appNavigationBar(Size size) {
  return NavigationBar(
    backgroundColor: AppColors.white,
    selectedIndex: 1,
    destinations: item,
    animationDuration: const Duration(milliseconds: 300),
    height: size.height * 0.08,
  );
}
