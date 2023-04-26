import 'package:flutter/material.dart';

import '../../features/home/widgets/app_custom_clipper.dart';
import '../constants/color_constant.dart';

class HeartStats extends StatelessWidget {
  const HeartStats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipBehavior: Clip.hardEdge,
      clipper: AppCustomClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.heartBar.withOpacity(0.8),
              Colors.grey.shade100,
              AppColors.white
            ],
            stops: const [0.35, 0.6, 0.8],
          ),
        ),
      ),
    );
  }
}

class HeartStatsWithStack extends StatelessWidget {
  const HeartStatsWithStack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipPath(
        clipBehavior: Clip.hardEdge,
        clipper: AppCustomClipper(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.heartBar.withOpacity(0.8),
                Colors.grey.shade100,
                AppColors.white
              ],
              stops: const [0.35, 0.6, 0.8],
            ),
          ),
        ),
      ),
    );
  }
}
