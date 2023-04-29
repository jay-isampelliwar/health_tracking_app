import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_tracking_app/core/constants/color_constant.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';
import 'package:health_tracking_app/locator.dart';
import 'package:hive/hive.dart';

import '../bloc/home_bloc.dart';

Dialog dialogBox({
  required Size size,
  required BuildContext context,
}) {
  final box = Hive.box("localData");
  final goals = Hive.box("goals");

  int water = box.get("glassWater") ?? 0;
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                locator
                    .get<HomeBloc>()
                    .add(HomeWaterDecreaseEvent(water: water));
              },
              child: Container(
                height: size.height * 0.08,
                width: size.width * 0.2,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor, shape: BoxShape.circle),
                child: Align(
                  child: Text(
                    "-",
                    style: AppTextStyles.text28(bold: false, size: size)
                        .copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Number of glass",
                  style: AppTextStyles.text14(bold: true, size: size),
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  bloc: locator.get<HomeBloc>(),
                  builder: (context, state) {
                    if (state is HomeWaterIncreaseState) {
                      water = state.water;
                      box.put("glassWater", water);

                      return Text(
                        state.water.toString(),
                        style: AppTextStyles.text20(bold: true, size: size),
                      );
                    } else if (state is HomeWaterDecreaseState) {
                      water = state.water;
                      box.put("glassWater", water);

                      return Text(
                        state.water.toString(),
                        style: AppTextStyles.text20(bold: true, size: size),
                      );
                    }
                    return Text(
                      water.toString(),
                      style: AppTextStyles.text20(bold: true, size: size),
                    );
                  },
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                locator
                    .get<HomeBloc>()
                    .add(HomeWaterIncreaseEvent(water: water));
              },
              child: Container(
                height: size.height * 0.08,
                width: size.width * 0.2,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor, shape: BoxShape.circle),
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
      ),
    ),
  );
}
