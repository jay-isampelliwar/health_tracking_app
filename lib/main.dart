import 'package:flutter/material.dart';
import 'package:health_tracking_app/locator.dart';

import 'features/auth/register/ui/register.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Goal(),
      home: Registration(),
      // home: OTPScreen(
      //   email: 'Jay@gmail.com',
      // ),
      // home: Login(),
      // home: MainWidget(),
      // home: Stats(),
      // home: Profile(),
      // home: Achievement(),
    );
  }
}
