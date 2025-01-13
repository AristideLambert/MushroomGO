import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/mushroom_scan.dart';
import 'package:mushroom_go/theme/mushroom_detail_theme.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';
import 'package:mushroom_go/utils/map/location_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MushroomScanColumn extends StatefulWidget {
  final MushroomScan mushroomScan;
  final MushroomDetailTheme? theme;

  const MushroomScanColumn({
    super.key,
    required this.mushroomScan,
    this.theme,
  });

  @override
  State<MushroomScanColumn> createState() => _MushroomScanColumnState();
}

class _MushroomScanColumnState extends State<MushroomScanColumn> {
  late MushroomDetailTheme theme;
  late final MapController _mapController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = (widget.theme ?? Theme.of(context).extension<MushroomDetailTheme>())!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(theme.radiusItem),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(MushroomGOFontUtils.history, color: Theme.of(context).primaryColor, size: theme.sizeIcon),
              SizedBox(width: theme.spaceBetweenText),
              Text(
                "${AppLocalizations.of(context)!.mushroomScanColumnHistory} - ${widget.mushroomScan.dateTime.day}/${widget.mushroomScan.dateTime.month}/${widget.mushroomScan.dateTime.year} "
                    "${widget.mushroomScan.dateTime.hour}:${widget.mushroomScan.dateTime.minute.toString().padLeft(2, '0')}",
                style: theme.titleStyle,
              )
            ],
          ),
          if(widget.mushroomScan.position != null) ... [
            SizedBox(height: theme.spaceBetweenTextMap),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(theme.radiusItem),
                  child: SizedBox(
                    height: theme.heightMap,
                    child: Stack(
                      children: [
                        FlutterMap(
                          mapController: _mapController,
                          options: MapOptions(
                            initialCenter: LatLng(widget.mushroomScan.position!.latitude, widget.mushroomScan.position!.longitude),
                            interactionOptions: InteractionOptions(
                                flags: InteractiveFlag.none
                            ),
                            initialZoom: theme.mapInitialZoom,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  point: LatLng(widget.mushroomScan.position!.latitude, widget.mushroomScan.position!.longitude),
                                  width: theme.sizeMarkerMap,
                                  height: theme.sizeMarkerMap,
                                  child: Icon(
                                    // TODO: Update icon
                                    CupertinoIcons.location_solid,
                                    color: Theme.of(context).primaryColor,
                                    size: theme.sizeMarkerMap / 2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () async {
                            await LocationUtils.openGoogleMaps(context, widget.mushroomScan.position!.latitude, widget.mushroomScan.position!.longitude);
                          },
                        )
                      ]
                    ),
                  ),
                ),
              ],
            ),
          ]
        ]
      ),
    );
  }
}