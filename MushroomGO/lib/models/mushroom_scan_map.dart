import 'package:latlong2/latlong.dart';
import 'package:mushroom_go/models/mushroom_scan.dart';

class MushroomScanMap {
  final  LatLng position;
  final List<MushroomScan> mushroomScan;

  MushroomScanMap({
    required this.position,
    required this.mushroomScan
  });
}
