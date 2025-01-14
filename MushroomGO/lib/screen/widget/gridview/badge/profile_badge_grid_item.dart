import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/models/mission.dart';
import 'package:mushroom_go/theme/profile_badge_grid_theme.dart';

class ProfileBadgeGridItem extends StatelessWidget {
  final int index;
  final int indexEnd;
  final Mission mission;
  final BuildContext mainContext;
  final ProfileBadgeGridTheme theme;

  const ProfileBadgeGridItem({super.key, required this.index, required this.indexEnd, required this.mission, required this.mainContext, required this.theme});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(mainContext).pushNamed(NavigationConstant.badgeDetailPage, arguments: mission);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/${mission.badgeFile}",
            fit: BoxFit.contain,
            height: theme.heightImage,
          ),
          SizedBox(height: theme.spaceBetweenTextImage),
          SizedBox(
            height: theme.textHeight,
            child: Text(
              mission.title,
              textAlign: TextAlign.center,
              style: theme.textStyle,
              maxLines: theme.textMaxLines,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          )
        ],
      ),
    );
  }
}