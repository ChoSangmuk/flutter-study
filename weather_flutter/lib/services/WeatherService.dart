import 'dart:math';
import 'package:weather_flutter/services/LocationService.dart';
import 'package:weather_flutter/services/APIService.dart';

// 위치 혹은 입력 도시 정보를 기반으로 날씨정보를 반환하는 Service
class WeatherService {
  final APIService apiService = APIService();
  final LocationService locationService = LocationService();

  Future<dynamic> getWeather({String cityName}) async {
    dynamic result;
    if (cityName != null)
      result = await apiService.getWeatherJson(cityName: cityName);

    if (result == 'cityNotFound' || cityName == null) {
      await locationService.getCurrentLocation();
      result = await apiService.getWeatherJson(
          lat: locationService.lat, lon: locationService.lon);
    }
    return result;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  String getImageResource(int temp) {
    Random random = Random();
    int temp = random.nextInt(3);
    print(temp);
    return 'images/location_background_${temp}.jpg';
  }
}
