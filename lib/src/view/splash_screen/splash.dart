import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weatherapi/src/res/image/image_sources.dart';
import 'package:weatherapi/src/view/home/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(image: AssetImage(splashImage),height: 300,width: 300,),
            ),
            SizedBox(height: 20,),
            Text("Weather",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),)
          ],
        ),
      ),
    );
  }
}
