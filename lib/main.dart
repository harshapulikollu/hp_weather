import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_weather/cubit/places/places_cubit.dart';
import 'package:hp_weather/cubit/weather/weather_cubit.dart';
import 'package:hp_weather/repository/places/get_places_repository.dart';
import 'package:hp_weather/repository/weather/get_weather_repository.dart';
import 'package:hp_weather/ui/pages/places.dart';
import 'package:hp_weather/ui/pages/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HP Weather',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color(0xFFF6F8FC),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider(create: (context) => WeatherCubit(GetWeatherRepositoryImpl()), child: const WeatherPage(),),
        '/places': (context) => BlocProvider(create: (context) => PlacesCubit(GetPlacesRepositoryImpl()), child: const PlacesPage(),),
      },
    );
  }
}
