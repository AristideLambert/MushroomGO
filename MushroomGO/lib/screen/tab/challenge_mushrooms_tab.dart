import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:mushroom_go/screen/widget/listview/challenge_mushrooms_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mushroom_go/screen/widget/popup/loading_container.dart';
import 'package:mushroom_go/screen/widget/popup/loading_error_container.dart';
import 'package:mushroom_go/utils/firebase/firestore_utils.dart';

class ChallengeMushroomsTab extends StatefulWidget {
  const ChallengeMushroomsTab({super.key});

  @override
  State<ChallengeMushroomsTab> createState() => _ChallengeMushroomsTabState();
}


class _ChallengeMushroomsTabState extends State<ChallengeMushroomsTab> {
  late Future<List<Mushroom>> _challengeMushrooms;

  @override
  void initState() {
    super.initState();
    _challengeMushrooms = FirestoreUtils.fetchChallengeMushroomsWithUnlockState(context);
  }

  void _reloadData() {
    setState(() {
      _challengeMushrooms = FirestoreUtils.fetchChallengeMushroomsWithUnlockState(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
        child: FutureBuilder<List<Mushroom>>(
          future: _challengeMushrooms,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Transform.translate(
                offset: Offset(0, -appBarHeight),
                child: LoadingContainer(message: AppLocalizations.of(context)!.challengeMushroomsLoadingData),
              );
            } else if (snapshot.hasError) {
              return LoadingErrorContainer(
                message: AppLocalizations.of(context)!.challengeMushroomsErrorLoadingData,
                onReload: _reloadData,
              );
            }
            final mushrooms = snapshot.data ?? [];
            return SingleChildScrollView(
              child: Column(
                children: [
                  ChallengeMushroomsListTab(
                    category: AppLocalizations.of(context)!.challengeMushroomsCommon,
                    mushrooms: mushrooms.where((m) => m.rarity == Rarity.common).toList(),
                  ),
                  const SizedBox(height: DimensionConstant.defaultPadding),
                  ChallengeMushroomsListTab(
                    category: AppLocalizations.of(context)!.challengeMushroomsRare,
                    mushrooms: mushrooms.where((m) => m.rarity == Rarity.rare).toList(),
                  ),
                  const SizedBox(height: DimensionConstant.defaultPadding),
                  ChallengeMushroomsListTab(
                    category: AppLocalizations.of(context)!.challengeMushroomsEpic,
                    mushrooms: mushrooms.where((m) => m.rarity == Rarity.epic).toList(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
