import 'package:flutter/material.dart';
import 'package:hp_weather/ui/widgets/attribution.dart';

class Credits extends StatelessWidget {
  const Credits({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Attribution(name: 'Open Weather Map', url: 'https://openweathermap.org/', showCopyright: true,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Attribution(name: 'Harsha Pulikollu', url: 'https://www.linkedin.com/in/harshapulikollu/'),
            Attribution(name: 'Source code', url: 'https://github.com/harshapulikollu/hp_weather'),
          ],
        ),
      ],
    );
  }
}
