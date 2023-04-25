import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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

GNav appNavigationBar(Size size) {
  return GNav(
      rippleColor: Colors.grey.shade800, // tab button ripple color when pressed
      hoverColor: Colors.grey.shade700, // tab button hover color
      haptic: true, // haptic feedback
      tabBorderRadius: 15,
      tabActiveBorder:
          Border.all(color: Colors.black, width: 1), // tab button border
      tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
      tabShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
      ], // tab button shadow
      curve: Curves.easeOutExpo, // tab animation curves
      duration: const Duration(milliseconds: 900), // tab animation duration
      gap: 8, // the tab button gap between icon and text
      color: Colors.grey[800], // unselected icon color
      activeColor: Colors.purple, // selected icon and text color
      iconSize: 24, // tab button icon size
      tabBackgroundColor:
          Colors.purple.withOpacity(0.1), // selected tab background color
      padding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 5), // navigation bar padding
      tabs: const [
        GButton(
          icon: Icons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.favorite,
          text: 'Likes',
        ),
        GButton(
          icon: Icons.search,
          text: 'Search',
        ),
        GButton(
          icon: Icons.person,
          text: 'Profile',
        )
      ]);
}
