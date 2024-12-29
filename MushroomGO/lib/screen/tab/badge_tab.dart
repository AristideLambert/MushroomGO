import 'package:flutter/material.dart';
import 'package:mushroom_go/models/mission.dart';
import 'package:mushroom_go/theme/badge_tab_theme.dart';

class BadgeTab extends StatefulWidget {
  final BadgeTabTheme? theme;
  const BadgeTab({super.key, this.theme});

  @override
  State<BadgeTab> createState() => _BadgeTabState();
}

class _BadgeTabState extends State<BadgeTab> {
  late BadgeTabTheme theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = (widget.theme ?? Theme.of(context).extension<BadgeTabTheme>())!;
  }

  final List<Mission> missions = [
    Mission(
      title: "Mushroom Hunter",
      description: "Find and collect 50 mushrooms.",
      currentProgress: 50,
      goal: 50,
      badge: 'assets/images/mushroom_hunter.png',
      isEarned: true,
      earnedDate: DateTime(2024, 10, 1),
    ),
    Mission(
      title: "Epic Mushroom Collector",
      description: "Collect 10 epic mushrooms in rare locations.",
      currentProgress: 7,
      goal: 10,
      badge: 'assets/images/epic_mushroom_collector.png',
      isEarned: true,
      earnedDate: DateTime(2024, 9, 15),
    ),
    Mission(
      title: "Mycology Expert",
      description: "Identify 20 different types of mushrooms.",
      currentProgress: 20,
      goal: 20,
      badge: 'assets/images/mycology_expert.png',
      isEarned: true,
      earnedDate: DateTime(2024, 9, 15),
    ),
    Mission(
      title: "Rare Mushroom Collector",
      description: "Find 5 rare mushrooms.",
      currentProgress: 5,
      goal: 5,
      badge: 'assets/images/rare_mushroom_collector.png',
      isEarned: true,
      earnedDate: DateTime(2024, 8, 20),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(theme.defaultPadding),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: theme.gridDelegateCrossAxisCount,
            crossAxisSpacing: theme.gridDelegateSpacing,
            mainAxisSpacing: theme.gridDelegateSpacing,
            childAspectRatio: theme.gridDelegateChildAspectRatio,
          ),
          itemCount: missions.length,
          itemBuilder: (context, index) {
            final mission = missions[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/BadgeDetailPage',
                      arguments: mission,
                    );
                  },
                  child: Image.asset(
                    mission.badge,
                    fit: BoxFit.contain,
                    height: theme.heightImage,
                  ),
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
