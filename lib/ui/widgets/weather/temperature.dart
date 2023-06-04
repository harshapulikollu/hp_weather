import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_weather/cubit/weather/weather_cubit.dart';
import 'package:hp_weather/ui/widgets/weather/temperature_units.dart';

class Temperature extends StatelessWidget {
  const Temperature({super.key, required this.temperature});
  final int temperature;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(temperature.toString(), style: const TextStyle(fontSize: 48.0),),
        const Text(
          '\u00B0',
          style: TextStyle(
            fontSize: 48.0,
            fontFeatures: [
              FontFeature.enable('sups'),
            ],
          ),
        ),
        const TemperatureUnits()
      ],
    );
  }
}
