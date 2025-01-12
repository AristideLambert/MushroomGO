import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mushroom_go/screen/page/account/benefit_account_page.dart';
import 'package:mushroom_go/utils/map/location_utils.dart';

class MapTab extends StatefulWidget {
  final BuildContext mainContext;
  const MapTab({super.key, required this.mainContext});

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  final MapController _mapController = MapController();
  LatLng? _currentPosition;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    FirebaseAuth.instance.authStateChanges().listen((User? user){
      setState(() {});
    });
  }

  Future<void> _getUserLocation() async {
    try {
      final position = await LocationUtils.getCurrentLocation();
      setState(() {
        _currentPosition = LatLng(position!.latitude, position.longitude);
        _isLoading = false;
      });
      if (_currentPosition != null) {
        _mapController.move(_currentPosition!, 8.0);
      }
    } catch (e) {
      debugPrint("Erreur lors de la récupération de la localisation : $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if(FirebaseAuth.instance.currentUser == null) {
      return BenefitAccountPage(mainContext: widget.mainContext);
    } else {
      if (_isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return Scaffold(
        body: FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialZoom: 8.0,
          ),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: const ['a', 'b', 'c'],
            ),
            if (_currentPosition != null)
              MarkerLayer(
                markers: [
                  Marker(
                    point: _currentPosition!,
                    width: 80,
                    height: 80,
                    child: const Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
          ],
        ),
      );
    }
  }
}
