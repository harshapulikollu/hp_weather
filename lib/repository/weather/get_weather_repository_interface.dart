import 'package:hp_weather/model/forecast.dart';
import 'package:hp_weather/model/weather.dart';

abstract class GetWeatherInterface {
  Future<Weather> getWeather(String lat, String lon, {String units = 'metric'});
  Future<Forecast> getForecast(String lat, String lon, {String units = 'metric'});
}