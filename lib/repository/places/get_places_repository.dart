import 'package:flutter/material.dart';
import 'package:hp_weather/helpers/places_api.dart';
import 'package:hp_weather/model/place.dart';
import 'package:hp_weather/repository/places/get_places_repository_interface.dart';

class GetPlacesRepositoryImpl extends GetPlacesInterface {
  @override
  Future<List<Place>> getPlaces(String placeName) async {
    //using OPEN SOURCE MAP NOMINITIM
    try {
      String url = '/search?q=$placeName&format=json&accept-language=en';

      PlacesApiBaseHelper helper = PlacesApiBaseHelper();
      final response = await helper.get(url);
      List<Place> places = [];
      response.forEach((e) => places.add(Place.fromJson(e)));
      return places;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
