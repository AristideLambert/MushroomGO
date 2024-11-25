import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/widget/listview/challenge_mushrooms_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChallengeMushroomsTab extends StatefulWidget {
  const ChallengeMushroomsTab({super.key});

  @override
  State<ChallengeMushroomsTab> createState() => _ChallengeMushroomsTabState();
}

class _ChallengeMushroomsTabState extends State<ChallengeMushroomsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ChallengeMushroomsListTab(
                category: AppLocalizations.of(context)!.challengeMushroomsCommon,
                itemCount: 10,
              ),
              const SizedBox(height: DimensionConstant.defaultPadding),
              ChallengeMushroomsListTab(
                category: AppLocalizations.of(context)!.challengeMushroomsRare,
                itemCount: 10
              ),
              const SizedBox(height: DimensionConstant.defaultPadding),
              ChallengeMushroomsListTab(
                category: AppLocalizations.of(context)!.challengeMushroomsEpic,
                itemCount: 10
              ),
            ],
          ),
        ),
      ),
    );
  }
}