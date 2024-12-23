import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/mission.dart';
import 'package:mushroom_go/screen/widget/listview/challenge_missions_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChallengeMissionsTab extends StatefulWidget {
  const ChallengeMissionsTab({super.key});

  @override
  State<ChallengeMissionsTab> createState() => _ChallengeMissionsTabState();
}

class _ChallengeMissionsTabState extends State<ChallengeMissionsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ChallengeMissionListTab(
                category: AppLocalizations.of(context)!.challengeMissionsWeakly,
                missions: [
                  Mission(
                    title: "Pick up 200 Coins",
                    description: "Collect 200 coins in a single run.",
                    currentProgress: 50,
                    goal: 200,
                  ),
                  Mission(
                    title: "Pick up 3 Magnets",
                    description: "Collect 3 magnets during your runs.",
                    currentProgress: 2,
                    goal: 3,
                  ),
                  Mission(
                    title: "Pick up 5 Rockets",
                    description: "Collect 5 Rockets during your runs.",
                    currentProgress: 2,
                    goal: 5,
                  ),
                ],
              ),
              const SizedBox(height: DimensionConstant.defaultPadding),
              ChallengeMissionListTab(
                category: AppLocalizations.of(context)!.challengeMissionsMonthly,
                missions: [
                  Mission(
                    title: "Score 10,000 Points",
                    description: "Reach 10,000 points in one run.",
                    currentProgress: 5000,
                    goal: 10000,
                  ),
                  Mission(
                    title: "Win 5 Games",
                    description: "Play and win 5 games.",
                    currentProgress: 3,
                    goal: 5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

