import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/mission.dart';
import 'package:mushroom_go/screen/widget/gridview/badge/profile_badge_grid_item.dart';
import 'package:mushroom_go/screen/widget/image/loading_image.dart';
import 'package:mushroom_go/theme/profile_badge_grid_theme.dart';

class ProfileBadgeGrid extends StatefulWidget {
  final List<Mission> missions;
  final bool loadIcon;
  final Future<void> Function() onRefresh;
  final bool Function(ScrollNotification)? onNotification;
  final BuildContext mainContext;
  final ProfileBadgeGridTheme? theme;

  const ProfileBadgeGrid({super.key, required this.missions, required this.loadIcon, required this.onRefresh, this.onNotification, required this.mainContext, this.theme});

  @override
  State<ProfileBadgeGrid> createState() => _ProfileBadgeGridState();
}

class _ProfileBadgeGridState extends State<ProfileBadgeGrid> {
  late ProfileBadgeGridTheme theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = (widget.theme ?? Theme.of(context).extension<ProfileBadgeGridTheme>())!;
  }

  int _loadingPosition(int x) {
    int a1 = 5;
    int d = 3;
    int n = ((x - a1) / d).ceil() + 1;
    int current = a1 + (n - 1) * d;
    if (x >= current - 1 && x <= current + 1) {
      current += d;
    }
    return current - widget.missions.length;
  }

  bool _isPositionLoading(int x) {
    int a1 = 5;
    int d = 3;
    return ((x + 1) - a1) % d == 0;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: widget.onNotification,
      child: RefreshIndicator(
        color: Theme.of(context).primaryColor,
        elevation: DimensionConstant.defaultElevation,
        onRefresh: widget.onRefresh,
        child: GridView.builder(
          padding: const EdgeInsets.only(
            left: DimensionConstant.defaultPadding,
            right: DimensionConstant.defaultPadding,
            bottom: DimensionConstant.defaultPadding
          ),
          itemCount: widget.missions.length + (widget.loadIcon ? _loadingPosition(widget.missions.length) : 0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: theme.gridDelegateCrossAxisCount,
            crossAxisSpacing: theme.gridDelegateCrossAxisSpacing,
            mainAxisSpacing: theme.gridDelegateMainAxisSpacing,
            childAspectRatio: theme.gridDelegateChildAspectRatio,
          ),
          itemBuilder: (context, index) {
            if(index < widget.missions.length){
              return ProfileBadgeGridItem(
                index: index,
                indexEnd: widget.missions.length,
                mission: widget.missions[index],
                mainContext: widget.mainContext,
                theme: theme
              );
            } else {
              return _isPositionLoading(index) ? Center(
                child: LoadingImage(size: theme.sizeImageLoading),
              ) : Container();
            }
          }
        )
      )
    );
  }
}