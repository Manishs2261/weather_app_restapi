import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weatherapi/src/view/home/home_screen.dart';
import 'package:weatherapi/src/view/splash_screen/splash.dart';
import 'package:weatherapi/src/view_model_provider/demoprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DemoProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home:
                //HomeScreen(),
                SplashScreen(),
          );
        },
      ),
    );
  }
}
