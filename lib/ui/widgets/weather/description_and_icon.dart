import 'package:flutter/material.dart';
import 'package:hp_weather/ui/widgets/weather/weather_icon.dart';
import 'package:hp_weather/util.dart';

class DescriptionAndIcon extends StatelessWidget {
  const DescriptionAndIcon({super.key, required this.description, required this.icon});
  final String description;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(description.capitalize() ?? '', style: const TextStyle(fontSize: 48.0, fontWeight: FontWeight.w400),)),
        WeatherIcon(icon: icon)
      ],
    );
  }
}
