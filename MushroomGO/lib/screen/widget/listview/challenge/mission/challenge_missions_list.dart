import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/mission.dart';
import 'package:mushroom_go/screen/widget/listview/challenge/mission/challenge_missions_list_item.dart';
import 'package:mushroom_go/theme/challenge_missions_list_theme.dart';

class ChallengeMissionListTab extends StatefulWidget {
  final String category;
  final List<Mission> missions;
  final ChallengeMissionListTheme? theme;
  final int index;

  const ChallengeMissionListTab({
    super.key,
    required this.category,
    required this.missions,
    this.theme,
    required this.index,
  });

  @override
  State<ChallengeMissionListTab> createState() => _ChallengeMissionListTabState();
}

class _ChallengeMissionListTabState extends State<ChallengeMissionListTab> {
  late ChallengeMissionListTheme _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = (widget.theme ?? Theme.of(context).extension<ChallengeMissionListTheme>())!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: DimensionConstant.defaultPadding,
        right: DimensionConstant.defaultPadding,
        top: widget.index == 0 ? DimensionConstant.defaultPadding : 0.0,
        bottom: DimensionConstant.defaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: _theme.marginTitle),
            child: Text(
              widget.category,
              style: _theme.titleStyle,
            ),
          ),
          SizedBox(height: _theme.spacingBetweenTitleAndList),
          ListView.builder(
            itemCount: widget.missions.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final mission = widget.missions[index];
              return ChallengeMissionItem(
                title: mission.title,
                description: mission.description,
                currentProgress: mission.currentProgress ?? 0,
                goal: mission.goal,
                theme: _theme,
              );
            },
          ),
        ],
      ),
    );
  }
}
