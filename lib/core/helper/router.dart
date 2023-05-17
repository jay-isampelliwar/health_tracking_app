import 'package:flutter/material.dart';

void routeWithPushReplacement(Widget widget, context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}
