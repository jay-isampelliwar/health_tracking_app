import 'dart:math';

import 'package:flutter/material.dart';

class AppCustomClipper extends CustomClipper<Path> {
  static double getRandomMiddle() {
    return Random().nextInt(200) + 50;
  }

  static double getRandomEdge() {
    return Random().nextInt(500) + 50;
  }

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double xScaling = size.width / 414;
    final double yScaling = size.height / 896;
    path.lineTo(0 * xScaling, 600 * yScaling);
    path.cubicTo(
      0 * xScaling,
      getRandomEdge() * yScaling,
      0 * xScaling,
      getRandomMiddle() * yScaling,
      0 * xScaling,
      300 * yScaling,
    );
    path.cubicTo(
      39.071997950236295 * xScaling,
      getRandomEdge() * yScaling,
      78.14399590047259 * xScaling,
      getRandomMiddle() * yScaling,
      115 * xScaling,
      191 * yScaling,
    );
    path.cubicTo(
      151.8560040995274 * xScaling,
      getRandomEdge() * yScaling,
      186.49601434834597 * xScaling,
      getRandomEdge() * yScaling,
      225 * xScaling,
      369 * yScaling,
    );
    path.cubicTo(
      263.50398565165403 * xScaling,
      getRandomEdge() * yScaling,
      305.8719467061436 * xScaling,
      323.293757710338 * yScaling,
      350 * xScaling,
      278 * yScaling,
    );
    path.cubicTo(
      394.1280532938564 * xScaling,
      getRandomEdge() * yScaling,
      440.0161988270796 * xScaling,
      getRandomMiddle() * yScaling,
      480 * xScaling,
      244 * yScaling,
    );
    path.cubicTo(
      519.9838011729204 * xScaling,
      getRandomMiddle() * yScaling,
      554.0632579855378 * xScaling,
      352.9361650439371 * yScaling,
      589 * xScaling,
      341 * yScaling,
    );
    path.cubicTo(
      623.9367420144622 * xScaling,
      getRandomEdge() * yScaling,
      659.7307692307693 * xScaling,
      getRandomMiddle() * yScaling,
      706 * xScaling,
      219 * yScaling,
    );
    path.cubicTo(
      752.2692307692307 * xScaling,
      getRandomMiddle() * yScaling,
      809.0136650913852 * xScaling,
      getRandomMiddle() * yScaling,
      854 * xScaling,
      301 * yScaling,
    );
    path.cubicTo(
      898.9863349086148 * xScaling,
      getRandomEdge() * yScaling,
      932.2145704036897 * xScaling,
      216.43696786805594 * yScaling,
      964 * xScaling,
      198 * yScaling,
    );
    path.cubicTo(
      995.7854295963103 * xScaling,
      getRandomMiddle() * yScaling,
      1026.1280532938565 * xScaling,
      228.43957562299533 * yScaling,
      1066 * xScaling,
      263 * yScaling,
    );
    path.cubicTo(
      1105.8719467061435 * xScaling,
      getRandomEdge() * yScaling,
      1155.2732164208849 * xScaling,
      317.8047296399628 * yScaling,
      1195 * xScaling,
      304 * yScaling,
    );
    path.cubicTo(
      1234.7267835791151 * xScaling,
      getRandomMiddle() * yScaling,
      1264.7790810226043 * xScaling,
      242.34150581715352 * yScaling,
      1304 * xScaling,
      236 * yScaling,
    );
    path.cubicTo(
      1343.2209189773957 * xScaling,
      getRandomMiddle() * yScaling,
      1391.6104594886979 * xScaling,
      264.8292470914232 * yScaling,
      1440 * xScaling,
      300 * yScaling,
    );
    path.cubicTo(
      1440 * xScaling,
      getRandomMiddle() * yScaling,
      1440 * xScaling,
      600 * yScaling,
      1440 * xScaling,
      600 * yScaling,
    );
    path.cubicTo(
      1440 * xScaling,
      600 * yScaling,
      0 * xScaling,
      600 * yScaling,
      0 * xScaling,
      600 * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
