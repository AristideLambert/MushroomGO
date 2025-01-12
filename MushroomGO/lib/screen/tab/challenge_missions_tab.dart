import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/mission.dart';
import 'package:mushroom_go/screen/widget/listview/challenge_missions_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mushroom_go/screen/widget/popup/loading_container.dart';
import 'package:mushroom_go/screen/widget/popup/loading_error_container.dart';
import 'package:mushroom_go/utils/firebase/firestore_utils.dart';

class ChallengeMissionsTab extends StatefulWidget {
  const ChallengeMissionsTab({super.key});

  @override
  State<ChallengeMissionsTab> createState() => _ChallengeMissionsTabState();
}

class _ChallengeMissionsTabState extends State<ChallengeMissionsTab> {
  late Future<Map<String, List<Mission>>> _missionCategories;

  @override
  void initState() {
    super.initState();
    _reloadData();
  }

  void _reloadData() {
    setState(() {
      _missionCategories = FirestoreUtils.fetchMissionsWithUserProgress(context)
          .then((missions) {
        final categories = <String, List<Mission>>{};
        for (var mission in missions) {
          categories.putIfAbsent(mission.frequency, () => []).add(mission);
        }
        return categories;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
        child: FutureBuilder<Map<String, List<Mission>>>(
          future: _missionCategories,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Transform.translate(
                offset: Offset(0, -appBarHeight),
                child: LoadingContainer(
                  message: AppLocalizations.of(context)!.challengeMissionsLoadingData,
                ),
              );
            } else if (snapshot.hasError) {
              return LoadingErrorContainer(
                message: AppLocalizations.of(context)!.challengeMissionsErrorLoadingData,
                onReload: _reloadData,
              );
            }

            final missionCategories = snapshot.data ?? {};
            return SingleChildScrollView(
              child: Column(
                children: List.generate(
                  missionCategories.keys.length,
                      (index) {
                    final category = missionCategories.keys.elementAt(index);
                    final missions = missionCategories[category] ?? [];
                    return ChallengeMissionListTab(
                      category: category == "weekly"
                          ? AppLocalizations.of(context)!.challengeMissionsWeakly
                          : AppLocalizations.of(context)!.challengeMissionsMonthly,
                      missions: missions,
                      index: index,
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
