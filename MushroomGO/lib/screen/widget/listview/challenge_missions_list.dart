import 'package:flutter/material.dart';
import 'package:mushroom_go/models/mission.dart';
import 'package:mushroom_go/screen/widget/listview/challenge_missions_list_item.dart';
import 'package:mushroom_go/theme/challenge_missions_list_theme.dart';

class ChallengeMissionListTab extends StatefulWidget {
  final String category;
  final List<Mission> missions;
  final ChallengeMissionListTheme? theme;

  const ChallengeMissionListTab({
    super.key,
    required this.category,
    required this.missions,
    this.theme,
  });

  @override
  State<ChallengeMissionListTab> createState() => _ChallengeMissionListTabState();
}

class _ChallengeMissionListTabState extends State<ChallengeMissionListTab> {
  late ChallengeMissionListTheme theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = (widget.theme ?? Theme.of(context).extension<ChallengeMissionListTheme>())!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: theme.marginTitle),
          child: Text(
            widget.category,
            style: theme.titleStyle,
          ),
        ),
        SizedBox(height: theme.spacingBetweenTitleAndList),
        ListView.builder(
          itemCount: widget.missions.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final mission = widget.missions[index];
            return ChallengeMissionItem(
              title: mission.title,
              description: mission.description,
              currentProgress: mission.currentProgress,
              goal: mission.goal,
              theme: theme,
            );
          },
        ),
      ],
    );
  }
}
