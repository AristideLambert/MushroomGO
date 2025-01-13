import 'package:flutter/material.dart';
import 'package:mushroom_go/models/firestore_pagination.dart';
import 'package:mushroom_go/models/mission.dart';
import 'package:mushroom_go/screen/widget/gridview/badge/profile_badge_grid.dart';
import 'package:mushroom_go/screen/widget/popup/loading_container.dart';
import 'package:mushroom_go/screen/widget/popup/loading_error_container.dart';
import 'package:mushroom_go/screen/widget/popup/loading_no_data_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mushroom_go/utils/firebase/firestore_utils.dart';

class ProfileBadgeTab extends StatefulWidget {
  final BuildContext mainContext;

  const ProfileBadgeTab({super.key, required this.mainContext});

  @override
  State<ProfileBadgeTab> createState() => _ProfileBadgeTabState();
}

class _ProfileBadgeTabState extends State<ProfileBadgeTab> {
  late final int _limit;
  late bool _isLoading;
  late bool _hasMore;
  late List<Mission> _missions;
  late FirestorePagination<Mission> _lastMissionResult;
  late Future<FirestorePagination<Mission>>? _missionResult;

  void _clearMission(){
    _lastMissionResult = FirestorePagination(limit: _limit, result: [], lastResultDateTime: []);
    _missions = [];
    _isLoading = false;
    _hasMore = false;
  }

  void _loadMission(){
    if (!mounted) return;
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
      _missionResult = FirestoreUtils.getMissionComplete(
        context,
        _limit,
        _lastMissionResult.lastResultDateTime!.firstWhere((map) => map.containsKey('lastDateTime'), orElse: () => {})["lastDateTime"],
      );
    });
    _missionResult!.then((result) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _hasMore = result.result.isNotEmpty && result.result.length > _limit / 2;
        if (result.result.isNotEmpty) {
          _missions.addAll(result.result);
          _lastMissionResult = result;
        }
      });
    }).catchError((error) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
    });
  }

  Future<void> _onRefresh() async {
    _clearMission();
    _loadMission();
  }

  @override
  void initState() {
    super.initState();
    _limit = 8;
    _clearMission();
    _loadMission();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirestorePagination<Mission>>(
      future: _missionResult,
      builder: (BuildContext context, AsyncSnapshot<FirestorePagination<Mission>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting && _missions.isEmpty) {
          return Center(
              child: LoadingContainer(
                  message: AppLocalizations.of(context)!.profileBadgeInProgressTitle
              )
          );
        } else if (snapshot.hasError) {
          return Center(
              child: LoadingErrorContainer(
                  message: AppLocalizations.of(context)!.profileBadgeErrorTitle,
                  onReload: _onRefresh
              )
          );
        } else if (!snapshot.hasData || (snapshot.data!.result.isEmpty && _missions.isEmpty)) {
          return LoadingNoDataContainer(
              title: AppLocalizations.of(context)!.profileBadgeNoBadgeTitle,
              onReload: _onRefresh
          );
        } else {
          return ProfileBadgeGrid(
            missions: _missions,
            loadIcon: _hasMore,
            onRefresh: _onRefresh,
            onNotification: (scrollInfo) {
              if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && !_isLoading && _hasMore) {
                _loadMission();
              }
              return false;
            },
            mainContext: widget.mainContext
          );
        }
      },
    );
  }
}
