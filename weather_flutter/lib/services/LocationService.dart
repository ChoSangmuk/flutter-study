import 'package:geolocator/geolocator.dart';

// 현재 위치 정보를 반환하는 Service
class LocationService {
  double lat;
  double lon;

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    // 위치 정보에 대한 인가 확인
    if (permission == LocationPermission.denied) {
      Geolocator.requestPermission();
    } else {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      lat = position.latitude;
      lon = position.longitude;
    }
  }
}
