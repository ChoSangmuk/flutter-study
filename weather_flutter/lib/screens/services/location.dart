// 현재 위치를 가져와서 반환하는 기능

import 'package:geolocator/geolocator.dart';

class LocationService {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );

    latitude = position.latitude;
    longitude = position.longitude;
  }
}
