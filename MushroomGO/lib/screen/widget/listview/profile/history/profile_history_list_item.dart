import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/models/mushroom_scan.dart';
import 'package:mushroom_go/screen/widget/image/loading_image.dart';
import 'package:mushroom_go/theme/profile_history_list_theme.dart';
import 'package:mushroom_go/utils/map/location_utils.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProfileHistoryListItem extends StatefulWidget {
  final int index;
  final int indexEnd;
  final MushroomScan mushroomScan;
  final BuildContext mainContext;
  final ProfileHistoryListTheme theme;

  const ProfileHistoryListItem({super.key, required this.index, required this.indexEnd, required this.mushroomScan, required this.mainContext, required this.theme});

  @override
  State<ProfileHistoryListItem> createState() => _ProfileHistoryListItemState();
}

class _ProfileHistoryListItemState extends State<ProfileHistoryListItem> {
  late Timer? _timer;
  late String? _distance;

  Future<void> _updateDistance() async {
    if(widget.mushroomScan.position == null){
      _distance = "";
    } else {
      _distance = await LocationUtils.getDistanceFromCurrent(context, widget.mushroomScan.position!.latitude, widget.mushroomScan.position!.longitude);
    }
  }

  void _loadDistance(){
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _updateDistance();
      });
    });
  }

  void _stopDistance(){
    if(_timer != null){
      if(_timer!.isActive){
        _timer?.cancel();
      }
      _timer == null;
    }
  }

  @override
  void initState() {
    super.initState();
    _distance = "";
    _timer = null;
  }

  @override
  void dispose() {
    _stopDistance();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      onVisibilityChanged: (visibilityInfo) {
        final visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage == 0) {
          _stopDistance();
        } else {
          _loadDistance();
        }
      },
      key: widget.key ?? UniqueKey(),
      child: GestureDetector(
        onTap: () {
          if(widget.mushroomScan.mushroom != null){
            Navigator.of(widget.mainContext).pushNamed(
              NavigationConstant.mushroomDetailPage,
              arguments: widget.mushroomScan,
            );
          }
        },
        child: Card(
          color: Theme.of(context).appBarTheme.backgroundColor,
          margin: EdgeInsets.only(top: widget.index == 0 ? 0 : DimensionConstant.defaultPadding, bottom: widget.index == widget.indexEnd - 1 ? DimensionConstant.defaultPadding * 1.1 : 0),
          child: Padding(
            padding: EdgeInsets.all(DimensionConstant.defaultPadding),
            child: Row(
              children: [
                if(widget.mushroomScan.mushroom != null) ... [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(widget.theme.radius),
                    child: Image.network(
                      widget.mushroomScan.mushroom!.imageUrl,
                      width: widget.theme.imageWidthHeight,
                      height: widget.theme.imageWidthHeight,
                      fit: BoxFit.cover,
                      loadingBuilder: ((context, image, event){
                        if (event == null) {
                          return image;
                        }
                        return LoadingImage(size: widget.theme.imageWidthHeight);
                      }),
                      errorBuilder: (context, error, stackTrace) {
                        return LoadingImage(size: widget.theme.imageWidthHeight);
                      },
                    ),
                  ),
                ] else ... [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(widget.theme.radius),
                    child: LoadingImage(size: widget.theme.imageWidthHeight)
                  ),
                ],
                SizedBox(width: widget.theme.spaceBetweenImageText),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.mushroomScan.scientificName,
                        style: widget.theme.titleStyle,
                      ),
                      SizedBox(height: widget.theme.spaceBetweenText),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.calendar,
                            size: widget.theme.textDateStyle.fontSize,
                            color: widget.theme.textDateStyle.color
                          ),
                          SizedBox(width: widget.theme.spaceBetweenText),
                          Text(
                              "${widget.mushroomScan.dateTime.day}/${widget.mushroomScan.dateTime.month}/${widget.mushroomScan.dateTime.year} "
                                  "${widget.mushroomScan.dateTime.hour}:${widget.mushroomScan.dateTime.minute.toString().padLeft(2, '0')}",
                              style: widget.theme.textDateStyle
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // TODO: Update icon
                    Icon(widget.mushroomScan.position == null ? CupertinoIcons.location_slash_fill : CupertinoIcons.location_fill, color: Theme.of(context).primaryColor),
                    SizedBox(
                        width: widget.theme.imageWidthHeight,
                        height: widget.theme.spaceBetweenText
                    ),
                    if(widget.mushroomScan.position != null) ... [
                      if(_distance == null || _distance!.isEmpty) ... [
                        SizedBox(
                          width: DimensionConstant.bodyText + 6,
                          height: DimensionConstant.bodyText + 6,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            backgroundColor: CupertinoColors.systemGrey,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      ] else ... [
                        Text(
                          _distance!,
                          style: widget.theme.textStyle,
                        ),
                      ]
                    ]
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}