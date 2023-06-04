import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({super.key, required this.icon, this.size = '2x'});
  final String icon;
  final String size;
  @override
  Widget build(BuildContext context) {
    String url = 'https://openweathermap.org/img/wn/$icon';
    if(size != '1x'){
      url += '@$size';
    }
    url += '.png';
    return Image.network(url,
      errorBuilder: (_, __, ___){
      return const Icon(Icons.warning);
    },);
  }
}
