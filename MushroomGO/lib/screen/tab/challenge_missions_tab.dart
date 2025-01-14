import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/mission.dart';
import 'package:mushroom_go/screen/widget/listview/challenge/mission/challenge_missions_list.dart';
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

  Future<void> _reloadData() async {
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
  void initState() {
    super.initState();
    _reloadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, List<Mission>>>(
        future: _missionCategories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingContainer(
              message: AppLocalizations.of(context)!.challengeMissionsLoadingData,
            );
          } else if (snapshot.hasError) {
            return LoadingErrorContainer(
              message: AppLocalizations.of(context)!.challengeMissionsErrorLoadingData,
              onReload: _reloadData,
            );
          }
          final missionCategories = snapshot.data ?? {};
          return RefreshIndicator(
            color: Theme.of(context).primaryColor,
            elevation: DimensionConstant.defaultElevation,
            onRefresh: _reloadData,
            child: SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
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
              ),
            ),
          );
        },
      ),
    );
  }
}