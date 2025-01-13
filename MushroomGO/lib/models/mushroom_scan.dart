import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:mushroom_go/utils/text/string_utils.dart';

class MushroomScan {
  final String scientificName;
  final DateTime dateTime;
  final Position? position;
  final Mushroom? mushroom;

  MushroomScan({
    required this.scientificName,
    required this.dateTime,
    this.position,
    this.mushroom
  });

  factory MushroomScan.fromMap(Map<String, Object?> data, Mushroom? mushroom) {
    return MushroomScan(
        scientificName: StringUtils.capitalizeEachWord(data['name_scientific'].toString()),
        dateTime: (data['date'] as Timestamp).toDate(),
        position: data['longitude'] != null && data['latitude'] != null ? Position(longitude: double.tryParse(data['longitude'].toString()) ?? 0.0, latitude: double.tryParse(data['latitude'].toString()) ?? 0.0, timestamp: (data['date'] as Timestamp).toDate(), accuracy: 0.0, altitude: 0.0, altitudeAccuracy: 0.0, heading: 0.0, headingAccuracy: 0.0, speed: 0.0, speedAccuracy: 0.0) : null,
        mushroom: mushroom
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name_scientific': scientificName,
      'mushroom_id': mushroom?.id,
      'latitude': position?.latitude,
      'longitude': position?.longitude,
      'date': dateTime.toUtc(),
      'user': FirebaseAuth.instance.currentUser!.uid
    };
  }
}
