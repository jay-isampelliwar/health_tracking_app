import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/constants/color_constant.dart';

class StepProgressIndicator extends CustomPainter {
  int step;
  StepProgressIndicator({required this.step});
  @override
  void paint(Canvas canvas, Size size) {
    Paint circle = Paint()
      ..strokeWidth = ((size.width + size.height) / 2) * 0.3
      ..color = AppColors.secondaryColor.withOpacity(0.2)
      ..style = PaintingStyle.stroke;

    Offset offset = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(offset, ((size.width + size.height) / 2) * 1.3, circle);

    Paint arc = Paint()
      ..strokeWidth = ((size.width + size.height) / 2) * 0.3
      ..color = AppColors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (step / 10000);
    canvas.drawArc(
        Rect.fromCircle(
            center: offset, radius: ((size.width + size.height) / 2) * 1.3),
        4.8,
        angle,
        false,
        arc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
