import 'package:flutter/material.dart';
import 'package:health_tracking_app/locator.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/goal/ui/goal.dart';

void main() async {
  setup();
  await Hive.initFlutter();
  await Hive.openBox("goals");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Goal(),
      // home: Registration(),
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
