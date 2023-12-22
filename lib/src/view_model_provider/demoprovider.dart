import 'package:flutter/cupertino.dart';
import 'package:weatherapi/src/model/weatherModel.dart';
import 'package:weatherapi/src/respository/repo.dart';

class DemoProvider with ChangeNotifier {
  var _sunrise;
  var _sunset;
  var _moonrise;
  var _moonset;
  var _maxtemp;
  var _mintemp;
  var _temp_c;
  var _pressure;
  var _humidity;
  var _realFell;
  var _uv;
  var _chanceToRain;
  var _day1_mintemp_c;
  var _day1_maxtemp_c;
  var _day2_mintemp_c;
  var _day2_maxtemp_c;

  var _day0_image;
  var _day1_image;
  var _day2_image;
  var _day2_date;

  var _day0_text;
  var _day1_text;
  var _day2_text;
  var _regionn;
  var _countryy;
  var _name_of_city;

  get name_of_city => _name_of_city;

  get regionn => _regionn;

  get countryy => _countryy;

  get day0_text => _day0_text;

  get day1_text => _day1_text;

  get day2_text => _day2_text;

  get day1_mintemp_c => _day1_mintemp_c;

  get day1_maxtemp_c => _day1_maxtemp_c;

  get day2_mintemp_c => _day2_mintemp_c;

  get day2_maxtemp_c => _day2_maxtemp_c;

  get day2_date => _day2_date;

  get day0_image => _day0_image;

  get day1_image => _day1_image;

  get day2_image => _day2_image;

  get sunrise => _sunrise;

  get sunset => _sunset;

  get moonrise => _moonrise;

  get moonset => _moonset;

  get maxtemp => _maxtemp;

  get mintemp => _mintemp;

  get temp_c => _temp_c;

  get pressure => _pressure;

  get humidity => _humidity;

  get realFell => _realFell;

  get uv => _uv;

  get chanceToRain => _chanceToRain;

  Future<void> settemp(String city) async {
    Weaather a = await Repo().getWeather(city);
    // var aa = (a.current!.tempC)?.toInt();
    _name_of_city = (a.location?.name);
    _temp_c = (a.current?.tempC)?.toInt();
    _pressure = a.current?.pressureMb;
    _humidity = a.current?.humidity;
    _realFell = a.current?.feelslikeC;
    _uv = a.current?.uv;
    _maxtemp = a.forecast!.forecastday?[0].day?.maxtempC?.toInt();
    _mintemp = a.forecast!.forecastday?[0].day?.mintempC?.toInt();
    _sunrise = a.forecast!.forecastday?[0].astro?.sunrise;
    _sunset = a.forecast!.forecastday?[0].astro?.sunset;
    _moonrise = a.forecast!.forecastday?[0].astro?.moonrise;
    _moonset = a.forecast!.forecastday?[0].astro?.moonset;
    _chanceToRain = a.forecast!.forecastday?[0].day?.dailyChanceOfRain;
    _day0_image = a.current?.condition?.icon;
    _day1_image = a.forecast?.forecastday?[1].day?.condition?.icon;
    _day2_image = a.forecast?.forecastday?[2].day?.condition?.icon;
    _day2_date = a.forecast?.forecastday?[2].date;
    _day1_maxtemp_c = a.forecast?.forecastday?[1].day?.maxtempC?.toInt();
    _day1_mintemp_c = a.forecast?.forecastday?[1].day?.mintempC?.toInt();
    _day2_maxtemp_c = a.forecast?.forecastday?[2].day?.maxtempC?.toInt();
    _day2_mintemp_c = a.forecast?.forecastday?[2].day?.mintempC?.toInt();
    _day0_text = a.forecast?.forecastday?[0].day?.condition?.text;
    _day1_text = a.forecast?.forecastday?[1].day?.condition?.text;
    _day2_text = a.forecast?.forecastday?[2].day?.condition?.text;
    _regionn = a.location?.region;
    _countryy = a.location?.country;

    notifyListeners();
  }
}
