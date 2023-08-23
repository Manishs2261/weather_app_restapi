import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:weatherapi/src/model/weatherModel.dart';

class Repo{

  getWeather(String city )async{

    var url = "http://api.weatherapi.com/v1/forecast.json?key=279ea0bc192448bf8e3101037230901&q=$city&days=5";
     final res = await http.get(Uri.parse(url));
     var resBody = res.body.toString();

     try{
       if(res.statusCode == 200)
         {
           return Weaather.fromJson(json.decode(resBody));
         }
     }catch(e)
    {
      throw e;
    }

  }
}