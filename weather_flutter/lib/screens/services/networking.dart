import 'dart:convert';

import 'package:http/http.dart';

class ApiHelper {
  Future<dynamic> getWeatherJsonFromLocation(
      double latitude, double longitude) async {
    Uri url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': latitude.toString(),
      'lon': longitude.toString(),
      'appid': '5df3f1b99c9227bb6bb15d61c2b5bf9b',
      'units': 'metric',
    });

    Response response = await get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
