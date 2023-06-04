import 'package:flutter/material.dart';

class ProbabilityOfPrecipitation extends StatelessWidget {
  const ProbabilityOfPrecipitation({super.key, required this.pop});
  final double pop;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.water_drop_outlined),
        const SizedBox(width: 4.0,),
        Text('$pop%')
      ],
    );
  }
}
