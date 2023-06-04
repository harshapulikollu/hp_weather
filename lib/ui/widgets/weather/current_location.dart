import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_weather/cubit/weather/weather_cubit.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key, required this.placeName});
  final String placeName;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () async {
              final latAndLong = await Navigator.pushNamed(context, '/places');
              if(latAndLong != null){
                // use of new dataType "record" in latest dart language
                (String, String) latLongRecord = latAndLong as (String, String);
                context.read<WeatherCubit>().setLatAndLong(latLongRecord.$1, latLongRecord.$2);
                context.read<WeatherCubit>().getWeatherAndForecastForLatLongPosition(latLongRecord.$1, latLongRecord.$2);
              }
            },
            child: Text(placeName),
        ),
      ],
    );
  }
}
