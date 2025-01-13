import 'package:flutter/material.dart';
import 'package:mushroom_go/models/firestore_pagination.dart';
import 'package:mushroom_go/models/mushroom_scan.dart';
import 'package:mushroom_go/screen/widget/listview/profile/profile_history_list.dart';
import 'package:mushroom_go/screen/widget/popup/loading_container.dart';
import 'package:mushroom_go/screen/widget/popup/loading_error_container.dart';
import 'package:mushroom_go/screen/widget/popup/loading_no_data_container.dart';
import 'package:mushroom_go/utils/firebase/firestore_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileHistoryTab extends StatefulWidget {
  final BuildContext mainContext;
  const ProfileHistoryTab({super.key, required this.mainContext});

  @override
  State<ProfileHistoryTab> createState() => _ProfileHistoryTabState();
}

class _ProfileHistoryTabState extends State<ProfileHistoryTab> {
  late final int _limit;
  late bool _isLoading;
  late bool _hasMore;
  late List<MushroomScan> _mushroomScans;
  late FirestorePagination<MushroomScan> _lastHistoryResult;
  late Future<FirestorePagination<MushroomScan>>? _historyResult;

  void _clearHistory(){
    _lastHistoryResult = FirestorePagination(limit: _limit, result: [], lastResultDateTime: []);
    _mushroomScans = [];
    _isLoading = false;
    _hasMore = false;
  }

  void _loadHistory(){
    if (!mounted) return;
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
      _historyResult = FirestoreUtils.getMushroomHistory(
        context,
        _limit,
        _lastHistoryResult.lastResultDateTime!.firstWhere((map) => map.containsKey('lastDateTime'), orElse: () => {})["lastDateTime"],
      );
    });
    _historyResult!.then((result) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _hasMore = result.result.isNotEmpty && result.result.length > _limit / 2;
        if (result.result.isNotEmpty) {
          _mushroomScans.addAll(result.result);
          _lastHistoryResult = result;
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
    _clearHistory();
    _loadHistory();
  }

  @override
  void initState() {
    super.initState();
    _limit = 8;
    _clearHistory();
    _loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirestorePagination<MushroomScan>>(
      future: _historyResult,
      builder: (BuildContext context, AsyncSnapshot<FirestorePagination<MushroomScan>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting && _mushroomScans.isEmpty) {
          return Center(
            child: LoadingContainer(
              message: AppLocalizations.of(context)!.profileHistoryInProgressTitle
            )
          );
        } else if (snapshot.hasError) {
          return Center(
            child: LoadingErrorContainer(
              message: AppLocalizations.of(context)!.profileHistoryErrorTitle,
              onReload: _onRefresh
            )
          );
        } else if (!snapshot.hasData || (snapshot.data!.result.isEmpty && _mushroomScans.isEmpty)) {
          return LoadingNoDataContainer(
            title: AppLocalizations.of(context)!.profileHistoryNoHistoryTitle,
            onReload: _onRefresh
          );
        } else {
          return ProfileHistoryList(mushroomScans: _mushroomScans,
            loadIcon: _hasMore,
            onRefresh: _onRefresh,
            onNotification: (scrollInfo) {
              if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && !_isLoading) {
                _loadHistory();
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