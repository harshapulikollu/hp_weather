part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherFetching extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherFetchingSuccessful extends WeatherState {
  final Weather weatherData;
  final List<ListElement> truncatedForecastData;
  const WeatherFetchingSuccessful({required this.weatherData, required this.truncatedForecastData});
  @override
  List<Object> get props => [weatherData, truncatedForecastData];
}

class WeatherFetchingFailed extends WeatherState {
  final String message;
  const WeatherFetchingFailed({required this.message});
  @override
  List<Object> get props => [message];
}
