import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_tracking_app/core/constants/color_constant.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';
import 'package:health_tracking_app/core/widgets/const_size_box.dart';
import 'package:health_tracking_app/locator.dart';
import 'package:hive/hive.dart';

import '../bloc/home_bloc.dart';

Dialog dialogBox({
  required Size size,
  required BuildContext context,
}) {
  final box = Hive.box("localData");

  return Dialog(
    backgroundColor: Colors.transparent,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.02, horizontal: size.width * 0.06),
        child: SizedBox(
          height: size.height * 0.2,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      locator
                          .get<HomeBloc>()
                          .add(HomeWaterLevelUpdateEvent(add: false));
                    },
                    child: Container(
                      height: size.height * 0.08,
                      width: size.width * 0.2,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle),
                      child: Align(
                        child: Text(
                          "-",
                          style: AppTextStyles.text28(bold: false, size: size)
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                  BlocBuilder<HomeBloc, HomeState>(
                    bloc: locator.get<HomeBloc>(),
                    builder: (context, state) {
                      if (state is HomeWaterLevelUpdate) {
                        return Text(
                          state.numberOfGlasses,
                          style: AppTextStyles.text20(bold: true, size: size),
                        );
                      } else {
                        return Text(
                          "0",
                          style: AppTextStyles.text28(bold: true, size: size),
                        );
                      }
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      locator
                          .get<HomeBloc>()
                          .add(HomeWaterLevelUpdateEvent(add: true));
                    },
                    child: Container(
                      height: size.height * 0.08,
                      width: size.width * 0.2,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle),
                      child: Align(
                        child: Text(
                          "+",
                          style: AppTextStyles.text28(bold: false, size: size)
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              AppConstSizeBox.constHightSizedBox(size.height * 0.05),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: AppColors.primaryColor,
                child: Text(
                  "Done",
                  style: AppTextStyles.text18(bold: false, size: size)
                      .copyWith(color: AppColors.white),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
