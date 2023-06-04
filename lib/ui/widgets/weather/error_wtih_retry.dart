import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_weather/cubit/weather/weather_cubit.dart';

class ErrorWithRetry extends StatelessWidget {
  const ErrorWithRetry({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          IconButton(onPressed:(){
            if(context.read<WeatherCubit>().latitude == '' || context.read<WeatherCubit>().longitude == ''){
              context.read<WeatherCubit>().checkLocationPermission();
            }else{
              context.read<WeatherCubit>().getWeatherAndForecastForLatLongPosition(context.read<WeatherCubit>().latitude, context.read<WeatherCubit>().longitude);
            }
          }, icon: const Icon(Icons.refresh_rounded)),
        ],
      ),
    );
  }
}
