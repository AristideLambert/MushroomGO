import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/mushroom_scan.dart';
import 'package:mushroom_go/screen/widget/image/loading_image.dart';
import 'package:mushroom_go/screen/widget/listview/profile/history/profile_history_list_item.dart';
import 'package:mushroom_go/theme/profile_history_list_theme.dart';

class ProfileHistoryList extends StatefulWidget {
  final List<MushroomScan> mushroomScans;
  final bool loadIcon;
  final Future<void> Function() onRefresh;
  final bool Function(ScrollNotification)? onNotification;
  final BuildContext mainContext;
  final ProfileHistoryListTheme? theme;

  const ProfileHistoryList({super.key, required this.mushroomScans, required this.loadIcon, required this.onRefresh, required this.onNotification, required this.mainContext, this.theme});

  @override
  State<ProfileHistoryList> createState() => _ProfileHistoryListState();
}

class _ProfileHistoryListState extends State<ProfileHistoryList> {
  late ProfileHistoryListTheme _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = widget.theme ?? Theme.of(context).extension<ProfileHistoryListTheme>()!;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: widget.onNotification,
      child: RefreshIndicator(
        color: Theme.of(context).primaryColor,
        elevation: DimensionConstant.defaultElevation,
        onRefresh: widget.onRefresh,
        child: ListView.builder(
          padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
          itemCount: widget.mushroomScans.length + (widget.loadIcon ? 1 : 0),
          itemBuilder: (context, index) {
            return index < widget.mushroomScans.length ?
              ProfileHistoryListItem(
                index: index,
                indexEnd: widget.mushroomScans.length,
                mushroomScan: widget.mushroomScans[index],
                mainContext: widget.mainContext,
                theme: _theme
              ) : Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: DimensionConstant.defaultPadding * 1.1),
                  child: LoadingImage(size: _theme.imageWidthHeight),
                ),
              );
          },
        ),
      ),
    );
  }
}