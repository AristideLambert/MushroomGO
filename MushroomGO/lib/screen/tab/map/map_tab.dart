import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/screen/page/account/benefit_account_page.dart';
import 'package:mushroom_go/screen/tab/map/map_content_tab.dart';
import 'package:mushroom_go/screen/widget/popup/loading_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MapTab extends StatelessWidget {
  final BuildContext mainContext;
  const MapTab({super.key, required this.mainContext});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LoadingContainer(message: AppLocalizations.of(context)!.mapInProgressTitle)
          );
        }
        if (snapshot.hasData && snapshot.data != null) {
          return MapContentTab(mainContext: mainContext);
        } else {
          return BenefitAccountPage(
            mainContext: mainContext
          );
        }
      }
    );
  }
}
