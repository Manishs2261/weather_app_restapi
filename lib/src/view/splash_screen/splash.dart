import 'package:flutter/material.dart';
import 'package:weatherapi/src/res/image/image_sources.dart';
import 'package:weatherapi/src/res/string/string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
