
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_weather/cubit/weather/weather_cubit.dart';
import 'package:hp_weather/ui/widgets/weather/error_wtih_retry.dart';
import 'package:hp_weather/ui/widgets/weather/weather_forecast.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state){
            if(state is WeatherFetching) return const Center(child: CircularProgressIndicator(),);
            if(state is WeatherFetchingFailed) return ErrorWithRetry(message: state.message);
            if(state is WeatherFetchingSuccessful) return TodayAndNext5DaysForecast(weatherData: state.weatherData, truncatedForecastData: state.truncatedForecastData,);
            return const SizedBox();
          },
        )

      ),
    );
  }
}