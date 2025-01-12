import 'dart:math';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class LocationUtils {

  LocationUtils._();

  static Future<bool> isEnable() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  static Future<LocationPermission> checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission;
  }

  static Future<Position?> getCurrentLocation() async {
    try {
      final LocationPermission permission = await checkPermission();
      if(await isEnable() && (permission != LocationPermission.denied || permission != LocationPermission.deniedForever)){
        return await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(
            accuracy: LocationAccuracy.high,
          ),
        );
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static double getDistance(double latitudeFrom, double longitudeFrom, double latitudeTo, double longitudeTo,){
    const double R = 6378137;
    double dLat = (latitudeTo - latitudeFrom) * (pi / 180.0);
    double dLon = (longitudeTo - longitudeFrom) * (pi / 180.0);
    double a = sin(dLat / 2) * sin(dLat / 2) + cos(latitudeFrom * (pi / 180.0)) * cos(latitudeTo * (pi / 180.0)) * sin(dLon / 2) * sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return R * c;
  }

  static Future<String> getDistanceFromCurrent(BuildContext context, double latitudeTo, double longitudeTo) async {
    Position? currentPosition = await getCurrentLocation();
    if(!context.mounted){
      return "";
    }
    if(currentPosition == null){
      return "";
    }
    final double distance = getDistance(currentPosition.latitude, currentPosition.longitude, latitudeTo, longitudeTo);
    if (distance <= 5) {
      return AppLocalizations.of(context)!.locationUtilsHere;
    } else if (distance < 1000) {
      return "${distance.round()} m";
    } else if (distance < 999000) {
      double km = distance / 1000.0;
      return "${km.toStringAsFixed(1)} km";
    } else {
      return "+999 km";
    }
  }
}
