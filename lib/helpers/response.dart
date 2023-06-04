import 'dart:convert';
import 'package:hp_weather/exceptions/network.dart';
import 'package:http/http.dart' as http;

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body);
      // debugPrint(responseJson);
      return responseJson;
    case 404:
      throw NotFoundException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Something went wrong with StatusCode : ${response.statusCode}');
  }
}