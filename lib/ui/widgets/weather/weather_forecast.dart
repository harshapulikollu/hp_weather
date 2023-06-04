import 'package:flutter/material.dart';
import 'package:hp_weather/model/forecast.dart';
import 'package:hp_weather/model/weather.dart';
import 'package:hp_weather/ui/widgets/attribution.dart';
import 'package:hp_weather/ui/widgets/credits.dart';
import 'package:hp_weather/ui/widgets/weather/forecast_details.dart';
import 'package:hp_weather/ui/widgets/weather/today_weather.dart';

class TodayAndNext5DaysForecast extends StatelessWidget {
  const TodayAndNext5DaysForecast({super.key, required this.weatherData, required this.truncatedForecastData});
  final Weather weatherData;
  final List<ListElement> truncatedForecastData;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: TodayWeather(weatherData: weatherData, todayForecastData: truncatedForecastData[0]),
        ),
        SliverList.separated(
          itemCount: truncatedForecastData.length-1,
            itemBuilder: (BuildContext context, int index){
            ListElement le = truncatedForecastData[index+1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ForecastDetails(forecastDetails: le),
          );
        },
        separatorBuilder:  (BuildContext context, int index){
          return const SizedBox(height: 4.0,);
        },),
        const SliverToBoxAdapter(
          child: Credits()
        )
      ],
    );
  }
}
