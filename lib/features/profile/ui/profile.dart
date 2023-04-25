import 'package:flutter/material.dart';
import 'package:health_tracking_app/core/constants/color_constant.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';
import 'package:health_tracking_app/features/chat_bot/ui/chat_bot.dart';

import '../../../core/widgets/app_custom_app_bar.dart';
import '../../../core/widgets/const_size_box.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.06,
          right: size.width * 0.06,
          top: size.height * 0.06,
          bottom: size.height * 0.04,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                title: "Your Profile",
                subtitle: "",
              ),
              AppConstSizeBox.constHightSizedBox(size.height * 0.04),
              Column(
                children: [
                  ProfileOptionContainer(
                    title: "Edit Profile",
                    icon: const Icon(Icons.edit),
                    onTap: () {},
                  ),
                  ProfileOptionContainer(
                    title: "Edit Goals",
                    icon: const Icon(Icons.edit),
                    onTap: () {},
                  ),
                  ProfileOptionContainer(
                    title: "Share Data",
                    icon: const Icon(Icons.share),
                    onTap: () {},
                  ),
                  ProfileOptionContainer(
                    title: "Theme",
                    icon: const Icon(Icons.color_lens),
                    onTap: () {},
                  ),
                  ProfileOptionContainer(
                    title: "Chat Bot",
                    icon: const Icon(Icons.chat_outlined),
                    onTap: () {
                      //! Navigate to Chat Screen
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChatBot()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileOptionContainer extends StatelessWidget {
  ProfileOptionContainer({
    required this.icon,
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final Icon icon;
  final String title;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.07,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
        margin: EdgeInsets.only(bottom: size.height * 0.01),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              size.width * 0.02,
            ),
            border: Border.all(color: AppColors.lightSecondaryColor, width: 1)),
        child: Row(
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: AppTextStyles.text22(bold: true, size: size),
                ),
                AppConstSizeBox.constWidthSizedBox(size.width * 0.03),
                icon
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}
