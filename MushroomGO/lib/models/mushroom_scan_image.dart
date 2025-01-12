import 'package:camera/camera.dart';
import 'package:geolocator/geolocator.dart';

class MushroomScanImage {
  final XFile xFile;
  final DateTime dateTime;
  final Position? position;

  MushroomScanImage({required this.xFile, required this.dateTime, this.position});
}