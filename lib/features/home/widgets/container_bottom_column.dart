import 'package:flutter/material.dart';

import '../../../core/constants/color_constant.dart';
import '../../../core/constants/text_styles.dart';

class ContainerBottomColumn extends StatelessWidget {
  const ContainerBottomColumn({
    Key? key,
    required this.value,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String value;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: AppTextStyles.text18(bold: true, size: size)
              .copyWith(color: color),
        ),
        Text(
          title,
          style: AppTextStyles.text18(bold: true, size: size)
              .copyWith(color: AppColors.secondaryColor),
        )
      ],
    );
  }
}
