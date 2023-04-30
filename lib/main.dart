import 'package:flutter/material.dart';
import 'package:health_tracking_app/features/Bmi/ui/bmi.dart';
import 'package:health_tracking_app/features/home/ui/home_screen.dart';
import 'package:health_tracking_app/locator.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/goal/ui/goal.dart';

void main() async {
  setup();
  await Hive.initFlutter();
  await Hive.openBox("goals");
  await Hive.openBox("stepCounter");
  await Hive.openBox("localData");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final box = Hive.box("goals");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: box.get("steps") != null &&
              box.get("calories") != null &&
              box.get("water") != null
          ? const MainWidget()
          : const BmiPage(),
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
