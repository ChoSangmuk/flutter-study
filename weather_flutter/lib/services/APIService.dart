import 'dart:convert';
import 'package:http/http.dart';
import 'package:weather_flutter/utilities/config.dart';

// API를 담당하는 Service
class APIService {
  final Config config = Config();
  final String authority = 'api.openweathermap.org';
  final String unencodedPath = '/data/2.5/weather';

  Future<dynamic> getWeatherJson(
      {double lat, double lon, String cityName}) async {
    Map<String, dynamic> queryParameters = {
      'appid': config.getWeatherAPIKey(),
      'units': 'metric',
    };

    if (cityName != null)
      queryParameters.addAll({'q': cityName});
    else
      queryParameters.addAll({'lat': lat.toString(), 'lon': lon.toString()});

    Response response =
        await get(Uri.https(authority, unencodedPath, queryParameters));

    if (response.statusCode == 200) {
      print('API Request Success.');
      return jsonDecode(response.body);
    } else if (response.statusCode == 404 && cityName != null) {
      print('City Name(${cityName}) not found!');
      return 'cityNotFound';
    } else {
      print(response.statusCode);
      return 'error';
    }
  }
}
