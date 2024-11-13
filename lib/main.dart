import 'package:flutter/material.dart';

import 'home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home_Screeen.routeName,
      routes: {
        Home_Screeen.routeName: (context) => Home_Screeen(),
      },
    );
  }
}
