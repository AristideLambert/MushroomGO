import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:mushroom_go/models/mushroom_scan.dart';
import 'package:mushroom_go/models/mushroom_scan_map.dart';

class MushroomScanMapUtils{

  MushroomScanMapUtils._();

  static LatLng _calculateGroupCenter(List<MushroomScan> mushroomScans) {
    double sumLatitude = 0.0;
    double sumLongitude = 0.0;
    for (var mushroomScan in mushroomScans) {
      if (mushroomScan.position != null) {
        sumLatitude += mushroomScan.position!.latitude;
        sumLongitude += mushroomScan.position!.longitude;
      }
    }
    double centerLatitude = sumLatitude / mushroomScans.length;
    double centerLongitude = sumLongitude / mushroomScans.length;
    return LatLng(centerLatitude, centerLongitude);
  }

  static List<MushroomScanMap> groupMushroomsSamePosition(List<MushroomScan> mushroomScans, double maxDistanceMeters) {
    List<MushroomScanMap> mushroomScanMaps = [];
    Set<MushroomScan> visited = {};
    for (MushroomScan mushroomScan in mushroomScans) {
      if (visited.contains(mushroomScan) || mushroomScan.position == null) continue;
      List<MushroomScan> group = [];
      for (MushroomScan otherMushroomScan in mushroomScans) {
        if (visited.contains(otherMushroomScan) || otherMushroomScan.position == null) {
          continue;
        }
        double distance = Geolocator.distanceBetween(
          mushroomScan.position!.latitude,
          mushroomScan.position!.longitude,
          otherMushroomScan.position!.latitude,
          otherMushroomScan.position!.longitude,
        );
        if (distance <= maxDistanceMeters) {
          group.add(otherMushroomScan);
          visited.add(otherMushroomScan);
        }
      }
      if (group.isNotEmpty) {
        LatLng center = _calculateGroupCenter(group);
        mushroomScanMaps.add(MushroomScanMap(
          position: center,
          mushroomScan: group,
        ));
      }
    }
    return mushroomScanMaps;
  }
}