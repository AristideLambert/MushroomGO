import 'package:geolocator/geolocator.dart';

class LocationUtils {
  static Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception("Service de localisation désactivé.");
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception("Permission de localisation refusée.");
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception("Permission de localisation refusée de façon permanente.");
      }
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      return Position(
        latitude: 50.8503,
        longitude: 4.3517,
        timestamp: DateTime.now(),
        accuracy: 0.0,
        altitude: 0.0,
        heading: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0,
          altitudeAccuracy: 0.0,
          headingAccuracy: 0.0
      );
    }
  }
}
