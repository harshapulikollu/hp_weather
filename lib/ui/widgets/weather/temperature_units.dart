import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_weather/cubit/weather/weather_cubit.dart';

class TemperatureUnits extends StatelessWidget {
  const TemperatureUnits({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // selected Units
        Text(context.read<WeatherCubit>().isCentigrade ? 'C' : 'F', style: const TextStyle(fontWeight: FontWeight.w600),),
        const SizedBox(width: 16.0,),
        //unselected units
        GestureDetector(onTap: (){
          context.read<WeatherCubit>().setUnits(!context.read<WeatherCubit>().isCentigrade);
          context.read<WeatherCubit>().getWeatherAndForecastForLatLongPosition(context.read<WeatherCubit>().latitude, context.read<WeatherCubit>().longitude);
        }, child: Text(context.read<WeatherCubit>().isCentigrade ? 'F' : 'C', style: const TextStyle(color: Colors.grey),))
      ],
    );
  }
}
