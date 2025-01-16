import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/models/mushroom_scan_map.dart';
import 'package:mushroom_go/screen/widget/image/loading_image.dart';

class ButtonMarkerMap extends StatefulWidget {
  final double size;
  final double zoom;
  final MushroomScanMap mushroomScanMap;
  final BuildContext mainContext;
  final Function()? onTap;

  const ButtonMarkerMap({
    super.key,
    required this.size,
    required this.zoom,
    required this.mushroomScanMap,
    required this.mainContext,
    this.onTap
  });

  @override
  State<ButtonMarkerMap> createState() => _ButtonMarkerMapState();
}

class _ButtonMarkerMapState extends State<ButtonMarkerMap> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, widget.zoom > DimensionConstant.zoomChangeMakerMap ? -widget.size / 2 : 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: widget.zoom > DimensionConstant.zoomChangeMakerMap ? null : widget.onTap,
            child: Stack(
              children: [
                Container(
                  width: widget.size - (widget.zoom > DimensionConstant.zoomChangeMakerMap ? DimensionConstant.heightTrianglePainterMakerMap : 0),
                  height: widget.size - (widget.zoom > DimensionConstant.zoomChangeMakerMap ? DimensionConstant.heightTrianglePainterMakerMap : 0),
                  padding: EdgeInsets.all(DimensionConstant.paddingMakerMap),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(DimensionConstant.radiusMakerMap),
                  ),
                  child: widget.zoom > DimensionConstant.zoomChangeMakerMap ? PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: widget.mushroomScanMap.mushroomScan.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final mushroom = widget.mushroomScanMap.mushroomScan[index];
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(widget.mainContext).pushNamed(NavigationConstant.mushroomDetailPage, arguments: mushroom);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(DimensionConstant.radiusMakerMap),
                          child: Image.network(
                            mushroom.mushroom?.imageUrl ?? '',
                            width: widget.size - DimensionConstant.heightTrianglePainterMakerMap,
                            height: widget.size - DimensionConstant.heightTrianglePainterMakerMap,
                            fit: BoxFit.cover,
                            loadingBuilder: ((context, image, event){
                              if (event == null) {
                                return image;
                              }
                              return LoadingImage(size: widget.size - DimensionConstant.heightTrianglePainterMakerMap);
                            }),
                            errorBuilder: (context, error, stackTrace) {
                              return LoadingImage(size: widget.size - DimensionConstant.heightTrianglePainterMakerMap);
                            },
                          ),
                        ),
                      );
                    },
                  ) : ClipRRect(
                    borderRadius: BorderRadius.circular(DimensionConstant.radiusMakerMap),
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: widget.size,
                      height: widget.size,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return LoadingImage(size: widget.size);
                      },
                    ),
                  ),
                ),
                if(widget.zoom > DimensionConstant.zoomChangeMakerMap && widget.mushroomScanMap.mushroomScan.length > 1) ... [
                  Positioned(
                    bottom: DimensionConstant.positionIndicatorMakerMap,
                    left: DimensionConstant.positionIndicatorMakerMap,
                    right: DimensionConstant.positionIndicatorMakerMap,
                    child: Container(
                      height: DimensionConstant.heightIndicatorMakerMap,
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey,
                        borderRadius: BorderRadius.circular(DimensionConstant.radiusIndicatorMakerMap),
                      ),
                      child: Stack(
                        children: [
                          FractionallySizedBox(
                            widthFactor: currentIndex + 1 <= widget.mushroomScanMap.mushroomScan.length ? (currentIndex + 1) / widget.mushroomScanMap.mushroomScan.length : 1.0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
          if (widget.zoom > DimensionConstant.zoomChangeMakerMap) ...[
            CustomPaint(
              size: const Size(DimensionConstant.widthTrianglePainterMakerMap, DimensionConstant.heightTrianglePainterMakerMap),
              painter: TrianglePainter(color: Theme.of(context).primaryColor),
            ),
          ],
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
