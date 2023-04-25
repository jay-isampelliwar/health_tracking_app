import 'package:flutter/material.dart';

import 'features/auth/register/ui/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      // home: Goal(),
      home: Registration(),
      // home: Login(),
      // home: MainWidget(),
      // home: Stats(),
      // home: Profile(),
      // home: Achievement(),
    );
  }
}
