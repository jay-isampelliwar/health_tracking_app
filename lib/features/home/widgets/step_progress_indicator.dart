import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../core/constants/color_constant.dart';

class StepProgressIndicator extends CustomPainter {
  final box = Hive.box("goals");
  @override
  void paint(Canvas canvas, Size size) {
    int steps = int.parse(box.get("steps"));
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

    double angle = 2 * pi * (3344 / steps);
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
