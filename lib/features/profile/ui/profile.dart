import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_tracking_app/core/constants/color_constant.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';
import 'package:health_tracking_app/core/widgets/app_snackbar.dart';
import 'package:health_tracking_app/features/auth/login/ui/login.dart';
import 'package:health_tracking_app/features/chat_bot/ui/chat_bot.dart';
import 'package:health_tracking_app/features/goal/ui/goal.dart';
import 'package:health_tracking_app/features/home/model/user_details_model.dart';
import 'package:health_tracking_app/locator.dart';
import 'package:hive/hive.dart';

import '../../../core/widgets/app_custom_app_bar.dart';
import '../../../core/widgets/const_size_box.dart';
import '../bloc/profile_bloc.dart';

class Profile extends StatelessWidget {
  UserDetailsModel userDetailsModel;
  Profile({required this.userDetailsModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final box = Hive.box("user");
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.06,
          right: size.width * 0.06,
          top: size.height * 0.06,
          bottom: size.height * 0.04,
        ),
        child: SingleChildScrollView(
          child: BlocConsumer<ProfileBloc, ProfileState>(
            bloc: locator.get<ProfileBloc>(),
            listenWhen: (previous, current) => current is ProfileActionState,
            buildWhen: (previous, current) => current is! ProfileActionState,
            listener: (context, state) {
              if (state is ProfileSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(appSnackBar(
                    size: size, message: state.message, color: Colors.green));
              } else if (state is ProfileErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(appSnackBar(
                    size: size, message: state.message, color: Colors.red));
              }
            },
            builder: (context, state) {
              if (state is ProfilePostLoadingState) {
                return Center(
                  child:
                      CircularProgressIndicator(color: AppColors.primaryColor),
                );
              } else {
                return Column(
                  children: [
                    CustomAppBar(
                      title: "Your Profile",
                      subtitle: "",
                    ),
                    AppConstSizeBox.constHightSizedBox(size.height * 0.04),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProfileOptionContainer(
                          title: "Edit Goals",
                          icon: const Icon(Icons.edit),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Goal()),
                            );
                          },
                        ),
                        ProfileOptionContainer(
                          title: "Post Data",
                          icon: const Icon(Icons.upload),
                          onTap: () {
                            locator
                                .get<ProfileBloc>()
                                .add(ProfilePostLoadingEvent());
                          },
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatBot()));
                          },
                        ),
                        ProfileOptionContainer(
                          title: "Log out",
                          icon: const Icon(Icons.logout),
                          onTap: () {
                            box.delete("token");
                            box.delete("email");
                            box.delete("password");
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                                (route) => false);
                          },
                        ),
                      ],
                    )
                  ],
                );
              }
            },
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
