import 'package:flutter/material.dart';

import '../../../core/constants/color_constant.dart';
import 'container_bottom_column.dart';
import 'container_row.dart';

class SquareContainer extends StatelessWidget {
  SquareContainer({
    required this.second,
    required this.title,
    required this.subTitle,
    required this.value,
    Key? key,
  }) : super(key: key);

  String title;
  Widget second;
  String subTitle;
  String value;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02,
          vertical: size.height * 0.02,
        ),
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.grey),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContainerRow(
                title: title,
                second: second,
                color: AppColors.black,
              ),
              const Spacer(),
              ContainerBottomColumn(
                value: value,
                title: subTitle,
                color: AppColors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
