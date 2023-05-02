import 'package:flutter/material.dart';
import 'package:health_tracking_app/locator.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/auth/login/ui/login.dart';
import 'features/home/ui/home_screen.dart';

void main() async {
  setup();
  await Hive.initFlutter();
  await Hive.openBox("goals");
  await Hive.openBox("stepCounter");
  await Hive.openBox("localData");
  await Hive.openBox("user");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final box = Hive.box("user");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: box.get("email") != null &&
              box.get("password") != null &&
              box.get("token") != null
          ? const MainWidget()
          : const Login(),
    );
  }
}
