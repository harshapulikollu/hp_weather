import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hp_weather/model/forecast.dart';
import 'package:hp_weather/model/weather.dart';
import 'package:hp_weather/repository/weather/get_weather_repository_interface.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherInterface _getWeatherInterface;
  WeatherCubit(
      this._getWeatherInterface
      ) : super(WeatherInitial()){
    checkLocationPermission();
  }

  String _latitude = '', _longitude = '';
  bool _useMetrics = true;

  String get latitude => _latitude;
  String get longitude => _longitude;

  bool get isCentigrade => _useMetrics;

  Future<void> checkLocationPermission() async{
    try {
      emit(WeatherFetching());
      bool locationServiceStatus = await Geolocator.isLocationServiceEnabled();
      if(!locationServiceStatus){
        emit(const WeatherFetchingFailed(message: 'GPS service is not enabled'));
        return;
      }
      await _getLocationPermission();
    } on Exception catch (e) {
      emit(WeatherFetchingFailed(message: e.toString()));
    }
  }

  Future<void> _getLocationPermission() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(const WeatherFetchingFailed(message: 'Location permissions are denied'));
        }else if(permission == LocationPermission.deniedForever){
          emit(const WeatherFetchingFailed(message: 'Location permissions are permanently denied'));
        }else{
          _getLocationCoordinates();
        }
      }else{
        _getLocationCoordinates();
      }
    } on Exception catch (e) {
      emit(WeatherFetchingFailed(message: e.toString()));
    }
  }

  Future<void> _getLocationCoordinates() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setLatAndLong(position.latitude.toString(), position.longitude.toString());

      await getWeatherAndForecastForLatLongPosition(position.latitude.toString(), position.longitude.toString());
    } on Exception catch (e) {
      emit(WeatherFetchingFailed(message: e.toString()));
    }
  }

  Future<void> getWeatherAndForecastForLatLongPosition(String latitude, String longitude) async{
   try{
     emit(WeatherFetching());
     Weather weatherData = await _getWeatherInterface.getWeather(latitude, longitude, units: _useMetrics ? 'metric' : 'imperial');
     Forecast forecastData = await _getWeatherInterface.getForecast(latitude, longitude, units: _useMetrics ? 'metric' : 'imperial');

     String splitDt = '';
      int index = -1;
     List<ListElement> truncatedForecastDataList= [];
     for(ListElement element in forecastData.list){
       if(splitDt != element.dtTxt.toString().split(' ')[0]){
         splitDt = element.dtTxt.toString().split(' ')[0];
         index++;
         truncatedForecastDataList.add(element);
       }else{
         if(truncatedForecastDataList[index].main.tempMin > element.main.tempMin){
           truncatedForecastDataList[index].main.tempMin = element.main.tempMin;
         }
         if(truncatedForecastDataList[index].main.tempMax < element.main.tempMax){
           truncatedForecastDataList[index].main.tempMax = element.main.tempMax;
         }
         if(truncatedForecastDataList[index].pop < element.pop){
           truncatedForecastDataList[index].pop = element.pop;
         }
       }
     }
     emit(WeatherFetchingSuccessful(weatherData: weatherData, truncatedForecastData: truncatedForecastDataList));
   }catch(e){
     emit(WeatherFetchingFailed(message: e.toString()));
   }
  }

  void setLatAndLong(String latitude, String longitude) {
    _latitude = latitude;
    _longitude = longitude;
  }

  void setUnits(bool isCentigrade){
    _useMetrics = isCentigrade;
  }
}
