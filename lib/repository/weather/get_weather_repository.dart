import 'package:flutter/material.dart';
import 'package:hp_weather/helpers/weather_api.dart';
import 'package:hp_weather/model/forecast.dart';
import 'package:hp_weather/model/weather.dart';
import 'package:hp_weather/repository/weather/get_weather_repository_interface.dart';

class GetWeatherRepositoryImpl extends GetWeatherInterface {
  @override
  Future<Weather>  getWeather(String lat, String lon, {String units = 'metric'}) async {
    //using open weather api
    try {
      const weatherApiKey = String.fromEnvironment('weatherApiKey', defaultValue: '');
      String url = '/weather?lat=$lat&lon=$lon&appid=$weatherApiKey&units=$units';

      WeatherApiBaseHelper helper = WeatherApiBaseHelper();
      final response = await helper.get(url);
      return Weather.fromJson(response);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<Forecast> getForecast(String lat, String lon, {String units = 'metric'}) async {
    try {
      const weatherApiKey = String.fromEnvironment('weatherApiKey', defaultValue: '');
      String url = '/forecast?lat=$lat&lon=$lon&appid=$weatherApiKey&units=$units';

      WeatherApiBaseHelper helper = WeatherApiBaseHelper();
      final response = await helper.get(url);
      return Forecast.fromJson(response);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}