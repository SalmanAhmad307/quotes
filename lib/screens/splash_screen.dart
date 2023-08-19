import 'dart:async';
import 'package:flutter/material.dart';
import 'package:random_qoutes/screens/home_screen.dart';

import '../constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context)=> const HomeScreen())));

  }
  @override
  Widget build(BuildContext context) {

    return const SafeArea(
      child: Scaffold(
          backgroundColor:Colors.amber,
          body: Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                        'Quotes App',
                      style: kSplashText,
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    CircularProgressIndicator(
                      color: Colors.white,
                    )

                  ]
              ),
            ),
          )
      ),
    );
  }
}
