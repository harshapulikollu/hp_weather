import 'package:hp_weather/model/place.dart';

abstract class GetPlacesInterface {
  Future<List<Place>> getPlaces(String placeName);
}