import 'package:flutter/material.dart';

SnackBar appSnackBar(
    {required Size size, required String message, required Color color}) {
  return SnackBar(
    backgroundColor: color,
    duration: const Duration(
      seconds: 3,
    ),
    content: Text(message),
  );
}
