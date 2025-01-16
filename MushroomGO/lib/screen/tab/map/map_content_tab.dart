import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/models/mushroom_scan_map.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';
import 'package:mushroom_go/utils/firebase/firestore_utils.dart';
import 'package:mushroom_go/utils/map/location_utils.dart';
import 'package:mushroom_go/screen/widget/button/map/button_location_map.dart';
import 'package:mushroom_go/screen/widget/button/map/button_marker_map.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mushroom_go/utils/map/mushroom_scan_map_utils.dart';

class MapContentTab extends StatefulWidget {
  final BuildContext mainContext;

  const MapContentTab({super.key, required this.mainContext});

  @override
  State<MapContentTab> createState() => _MapContentTabState();
}

class _MapContentTabState extends State<MapContentTab> {
  late final MapController _mapController;
  late LatLng? _userPosition;
  late double _currentZoom;
  late List<Marker> _marker;
  late bool? _isCollaborative;
  late List<MushroomScanMap> _mushroomScanMaps;

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _userPosition = null;
    _currentZoom = DimensionConstant.initialZoomMap;
    _marker = [];
    _isCollaborative = true;
    _mushroomScanMaps = [];
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Position? position = await LocationUtils.getCurrentLocation();
      if(position != null){
        _userPosition = LatLng(position.latitude, position.longitude);
        _mapController.move(_userPosition!, DimensionConstant.initialZoomMap);
      }
    });
  }

  double _getMarkerSize() {
    const double baseSize = DimensionConstant.sizeBaseMakerMap;
    double scaleFactor = _currentZoom > DimensionConstant.zoomChangeMakerMap ? DimensionConstant.scaleFactorAfterZoomMakerMap : DimensionConstant.scaleFactorBeforeZoomMakerMap;
    return baseSize + (_currentZoom * scaleFactor);
  }

  void _updateDisplay(){
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      setState(() {
        _marker.clear();
        _marker = _mushroomScanMaps.map((mushroomScanMap) {
          return Marker(
            point: mushroomScanMap.position,
            width: _getMarkerSize(),
            height: _getMarkerSize(),
            child: ButtonMarkerMap(
              size: _getMarkerSize(),
              zoom: _currentZoom,
              mushroomScanMap: mushroomScanMap,
              mainContext: widget.mainContext,
              onTap: (){
                _mapController.move(mushroomScanMap.position, DimensionConstant.maxZoomMap);
              },
            ),
          );
        }).toList();
      });
    });
  }

  Future<void> _loadData(MapCamera mapCamera) async {
    final bounds = mapCamera.visibleBounds;
    final northWest = bounds.northWest;
    final southEast = bounds.southEast;
    final data = await FirestoreUtils.getMushroomHistoryPosition(context, northWest, southEast, !(_isCollaborative ?? true));
    if (!mounted) return;
    setState(() {
      _mushroomScanMaps = MushroomScanMapUtils.groupMushroomsSamePosition(data, 10);
      _updateDisplay();
    });
  }

  void _getUserPosition() async {
    Position? position = await LocationUtils.getCurrentLocation();
    if(position != null) {
      _userPosition = LatLng(position.latitude, position.longitude);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: LatLng(50.620023, 5.582417),
              initialZoom: _currentZoom,
              minZoom: DimensionConstant.minZoomMap,
              maxZoom: DimensionConstant.maxZoomMap,
              interactionOptions: InteractionOptions(
                flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              ),
              onPositionChanged: (camera, isChanged) {
                if (!isChanged) {
                  _loadData(camera);
                }
                if (mounted) {
                  setState(() {
                    _currentZoom = camera.zoom;
                    _updateDisplay();
                  });
                }
              },
              onMapEvent: (event) {
                if (event is MapEventMoveEnd) {
                  _loadData(event.camera);
                }
              },
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              ),
              CurrentLocationLayer(

              ),
              MarkerLayer(
                markers: _marker,
              )
            ]
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(DimensionConstant.defaultPadding),
              child: CupertinoSlidingSegmentedControl<bool>(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                groupValue: _isCollaborative,
                children: {
                  true: TextOutput(text: AppLocalizations.of(context)!.mapCollaborativeTitle, type: Type.mediumTitle),
                  false: TextOutput(text: AppLocalizations.of(context)!.mapPersonalTitle, type: Type.mediumTitle),
                },
                onValueChanged: (newValue) {
                  setState(() {
                    _isCollaborative = newValue;
                    _loadData(_mapController.camera);
                  });
                }
              ),
            )
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ButtonLocationMap(
        onTap: () async {
          _getUserPosition();
          if(_userPosition != null){
            _mapController.move(
              _userPosition!,
              DimensionConstant.initialZoomMap
            );
          }
        },
      ),
    );
  }
}