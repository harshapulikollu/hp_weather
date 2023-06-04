import 'package:flutter/material.dart';
import 'package:hp_weather/ui/widgets/weather/weather_icon.dart';
import 'package:intl/intl.dart';

class DateAndIcon extends StatelessWidget {
  const DateAndIcon({super.key, required this.icon, required this.dateTime});
  final DateTime dateTime;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text('${_getFormattedDay(dateTime)},', style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),),
            Text('${_getFormattedDate(dateTime)}'),
          ],
        ),
        const Spacer(),
        _isToday(dateTime) ? const SizedBox() :WeatherIcon(icon: icon, size: '1x',),
      ],
    );
  }

  String _getFormattedDay(DateTime dateTime) {
    return _isToday(dateTime) ? 'Today' : DateFormat('EEEE').format(dateTime);
  }

  _getFormattedDate(DateTime dateTime) {
    return DateFormat('dd MMM').format(dateTime);
  }

  bool _isToday(DateTime dateTime) {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');
    final formattedDateTime = formatter.format(dateTime);
    final formattedNow = formatter.format(now);
    return formattedDateTime == formattedNow;
  }
}
