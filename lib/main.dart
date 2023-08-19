import 'package:flutter/material.dart';
import 'package:random_qoutes/screens/home_screen.dart';
import 'package:random_qoutes/screens/splash_screen.dart';
import 'package:random_qoutes/screens/test.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(

      home:SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

