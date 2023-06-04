import 'dart:io';
import 'package:hp_weather/exceptions/network.dart';
import 'package:hp_weather/helpers/response.dart';
import 'package:http/http.dart' as http;

class WeatherApiBaseHelper {
  final String _baseUrl = "https://api.openweathermap.org/data/2.5";

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(_baseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}