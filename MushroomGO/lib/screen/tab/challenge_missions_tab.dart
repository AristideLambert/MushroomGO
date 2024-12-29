import 'package:flutter/material.dart';
import 'package:mushroom_go/models/mission.dart';
import 'package:mushroom_go/screen/widget/listview/challenge_missions_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChallengeMissionsTab extends StatefulWidget {
  const ChallengeMissionsTab({super.key});

  @override
  State<ChallengeMissionsTab> createState() => _ChallengeMissionsTabState();
}

class _ChallengeMissionsTabState extends State<ChallengeMissionsTab> {
  late List<Map<String, dynamic>> missionCategories;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    missionCategories = [
      {
        'category': AppLocalizations.of(context)!.challengeMissionsWeakly,
        'missions': [
          Mission(
            title: "Pick up 200 Coins",
            description: "Collect 200 coins in a single run.",
            currentProgress: 50,
            goal: 200,
            badge: 'assets/images/rare_mushroom_collector.png',
              isEarned: false
          ),
          Mission(
            title: "Pick up 3 Magnets",
            description: "Collect 3 magnets during your runs.",
            currentProgress: 2,
            goal: 3,
            badge: 'assets/images/rare_mushroom_collector.png',
              isEarned: false
          ),
          Mission(
            title: "Pick up 5 Rockets",
            description: "Collect 5 Rockets during your runs.",
            currentProgress: 2,
            goal: 5,
            badge: 'assets/images/rare_mushroom_collector.png',
              isEarned: false
          ),
        ],
      },
      {
        'category': AppLocalizations.of(context)!.challengeMissionsMonthly,
        'missions': [
          Mission(
            title: "Score 10,000 Points",
            description: "Reach 10,000 points in one run.",
            currentProgress: 5000,
            goal: 10000,
            badge: 'assets/images/rare_mushroom_collector.png',
              isEarned: false
          ),
          Mission(
            title: "Win 5 Games",
            description: "Play and win 5 games.",
            currentProgress: 3,
            goal: 5,
            badge: 'assets/images/rare_mushroom_collector.png',
            isEarned: false
          ),
        ],
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            missionCategories.length,
                (index) => ChallengeMissionListTab(
              category: missionCategories[index]['category'],
              missions: missionCategories[index]['missions'],
              index: index, // Pass index dynamically
            ),
          ),
        ),
      ),
    );
  }
}
