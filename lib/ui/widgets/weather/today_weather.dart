import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hp_weather/model/forecast.dart';
import 'package:hp_weather/model/weather.dart';
import 'package:hp_weather/ui/widgets/weather/description_and_icon.dart';
import 'package:hp_weather/ui/widgets/weather/forecast_details.dart';
import 'package:hp_weather/ui/widgets/weather/temperature.dart';

import 'current_location.dart';

class TodayWeather extends StatelessWidget {
  const TodayWeather({super.key, required this.weatherData, required this.todayForecastData});
  final Weather weatherData;
  final ListElement todayForecastData;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CurrentLocation(placeName: weatherData.name,),
            DescriptionAndIcon(description: weatherData.weather[0].description, icon: weatherData.weather[0].icon,),
            Temperature(temperature: weatherData.main.temp.round(),),
            ForecastDetails(forecastDetails: todayForecastData, removeElevation: true,),
          ],
        )
      ),
    );
  }
}
