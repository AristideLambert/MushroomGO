import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:mushroom_go/screen/widget/listview/challenge/mushroom/challenge_mushrooms_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mushroom_go/screen/widget/popup/loading_container.dart';
import 'package:mushroom_go/screen/widget/popup/loading_error_container.dart';
import 'package:mushroom_go/utils/firebase/firestore_utils.dart';

class ChallengeMushroomsTab extends StatefulWidget {
  final BuildContext mainContext;

  const ChallengeMushroomsTab({super.key, required this.mainContext});

  @override
  State<ChallengeMushroomsTab> createState() => _ChallengeMushroomsTabState();
}


class _ChallengeMushroomsTabState extends State<ChallengeMushroomsTab> {
  late Future<List<Mushroom>> _challengeMushrooms;

  Future<void> _reloadData() async {
    setState(() {
      _challengeMushrooms = FirestoreUtils.fetchChallengeMushroomsWithUnlockState(context);
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
      body: FutureBuilder<List<Mushroom>>(
        future: _challengeMushrooms,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingContainer(message: AppLocalizations.of(context)!.challengeMushroomsLoadingData);
          } else if (snapshot.hasError) {
            return LoadingErrorContainer(
              message: AppLocalizations.of(context)!.challengeMushroomsErrorLoadingData,
              onReload: _reloadData,
            );
          }
          final mushrooms = snapshot.data ?? [];
          return RefreshIndicator(
            color: Theme.of(context).primaryColor,
            elevation: DimensionConstant.defaultElevation,
            onRefresh: _reloadData,
            child: SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    ChallengeMushroomsListTab(
                      category: AppLocalizations.of(context)!.challengeMushroomsCommon,
                      mushrooms: mushrooms.where((m) => m.rarity == Rarity.common).toList(),
                      index: 0,
                      indexEnd: 2,
                      mainContext: widget.mainContext,
                    ),
                    const SizedBox(height: DimensionConstant.defaultPadding),
                    ChallengeMushroomsListTab(
                      category: AppLocalizations.of(context)!.challengeMushroomsRare,
                      mushrooms: mushrooms.where((m) => m.rarity == Rarity.rare).toList(),
                      index: 1,
                      indexEnd: 2,
                      mainContext: widget.mainContext,
                    ),
                    const SizedBox(height: DimensionConstant.defaultPadding),
                    ChallengeMushroomsListTab(
                      category: AppLocalizations.of(context)!.challengeMushroomsEpic,
                      mushrooms: mushrooms.where((m) => m.rarity == Rarity.epic).toList(),
                      index: 2,
                      indexEnd: 2,
                      mainContext: widget.mainContext,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
