import 'package:flutter/material.dart';

class MinMaxTemp extends StatelessWidget {
  const MinMaxTemp({super.key, required this.minTemp, required this.maxTemp});
  final double minTemp;
  final double maxTemp;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${minTemp.round().toString()}\u00B0',),
        const SizedBox(width: 4.0,),
        Text('${maxTemp.round().toString()}\u00B0',  style: const TextStyle(
          color: Colors.grey
        ),),
      ],
    );
  }
}
