import 'package:flutter/material.dart';

import '../constants/color_constant.dart';
import '../constants/text_styles.dart';
import 'const_size_box.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    required this.title,
    required this.subtitle,
    this.profile = true,
    Key? key,
  }) : super(key: key);

  String title;
  String subtitle;
  bool profile;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.text28(bold: true, size: size),
            ),
            AppConstSizeBox.constHightSizedBox(size.height * 0.005),
            Text(
              subtitle,
              style: AppTextStyles.text18(bold: false, size: size).copyWith(
                color: AppColors.grey,
              ),
            )
          ],
        ),
        profile
            ? Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
