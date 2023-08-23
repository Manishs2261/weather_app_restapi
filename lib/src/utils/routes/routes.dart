import 'package:flutter/material.dart';
import 'package:weatherapi/src/utils/routes/routes_name.dart';
import 'package:weatherapi/src/view/home/home_screen.dart';
import 'package:weatherapi/src/view/splash_screen/splash.dart';

class Routes{

  static MaterialPageRoute generateRoutes(RouteSettings settings)
  {
    final argume = settings.arguments;

    switch(settings.name){

      case RoutesName.splashview :
        return MaterialPageRoute(builder: (BuildContext context ) => SplashScreen());

      case RoutesName.home:
        return MaterialPageRoute(builder:(BuildContext context) => HomeScreen("") );

      default :
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('No route define'),
            ),
          );
        });


    }
  }
}