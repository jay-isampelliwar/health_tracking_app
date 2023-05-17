import 'package:flutter/material.dart';

import '../../../core/constants/text_styles.dart';

class ContainerRow extends StatelessWidget {
  String title;
  Widget second;
  Color color;
  ContainerRow({
    required this.title,
    required this.second,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.text18(bold: false, size: size)
              .copyWith(color: color),
        ),
        const Spacer(),
        second
      ],
    );
  }
}
