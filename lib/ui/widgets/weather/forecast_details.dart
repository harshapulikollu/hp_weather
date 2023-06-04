import 'package:flutter/material.dart';
import 'package:hp_weather/model/forecast.dart';
import 'package:hp_weather/ui/widgets/weather/date_and_icon.dart';
import 'package:hp_weather/ui/widgets/weather/min_max_temp.dart';
import 'package:hp_weather/ui/widgets/weather/probability_of_precipitation.dart';

class ForecastDetails extends StatelessWidget {
  const ForecastDetails({super.key, required this.forecastDetails, this.removeElevation = false});
  final ListElement forecastDetails;
  final bool removeElevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0.0,//removeElevation ? 0.0 : 0.8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: DateAndIcon(dateTime: forecastDetails.dtTxt, icon: forecastDetails.weather[0].icon)),
            MinMaxTemp(minTemp: forecastDetails.main.tempMin, maxTemp: forecastDetails.main.tempMax),
            const SizedBox(width: 16.0,),
            ProbabilityOfPrecipitation(pop: forecastDetails.pop)
          ],
        ),
      ),
    );
  }
}
