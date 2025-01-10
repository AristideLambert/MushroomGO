import 'package:flutter/material.dart';
import 'package:mushroom_go/exception/loading_exception.dart';
import 'package:mushroom_go/models/firestore_pagination.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:mushroom_go/screen/widget/listview/search/search_result_list.dart';
import 'package:mushroom_go/screen/widget/popup/loading_container.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';
import 'package:mushroom_go/utils/dialog/dialog_utils.dart';
import 'package:mushroom_go/utils/firebase/firestore_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchResultPage extends StatefulWidget {
  final TextEditingController controllerSearch;

  const SearchResultPage({super.key, required this.controllerSearch});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  late bool _isLoading;
  late bool _hasMore;
  late List<Mushroom> mushrooms;
  late FirestorePagination<Mushroom> _lastSearchResult;
  late Future<FirestorePagination<Mushroom>>? _searchResult;

  void _clearSearch(){
    _lastSearchResult = FirestorePagination(limit: 15, result: [], lastResult: []);
    mushrooms = [];
    _isLoading = false;
    _hasMore = false;
  }

  void _search() {
    if (!mounted) return;
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
      _searchResult = FirestoreUtils.searchMushroom(
        context,
        widget.controllerSearch.text,
        15,
        _lastSearchResult.lastResult.firstWhere((map) => map.containsKey('lastResultName'), orElse: () => {})["lastResultName"],
        _lastSearchResult.lastResult.firstWhere((map) => map.containsKey('lastResultNameScientific'), orElse: () => {})["lastResultNameScientific"],
      );
    });
    _searchResult!.then((result) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _hasMore = result.result.isNotEmpty && result.result.length > 9;
        if (result.result.isNotEmpty) {
          mushrooms.addAll(result.result);
          _lastSearchResult = result;
        }
      });
    }).catchError((error) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
      if(error is LoadingException){
        DialogUtils.showPopupInformation(context, error.title, error.content, AppLocalizations.of(context)!.popupOK, (){
          widget.controllerSearch.clear();
        }, false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _clearSearch();
    widget.controllerSearch.addListener(() {
      _clearSearch();
      if (!_isLoading) {
        _search();
      }
    });
    _search();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && !_isLoading) {
          _search();
        }
        return false;
      },
      child: FutureBuilder<FirestorePagination<Mushroom>>(
        future: _searchResult,
        builder: (BuildContext context, AsyncSnapshot<FirestorePagination<Mushroom>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting && mushrooms.isEmpty) {
            return LoadingContainer(message: AppLocalizations.of(context)!.searchResultInProgressTitle);
          } else if (snapshot.hasError) {
            return Container();
          } else if (!snapshot.hasData || (snapshot.data!.result.isEmpty && mushrooms.isEmpty)) {
            return Center(
              child: TextOutput(
                text: AppLocalizations.of(context)!.searchResultTitleNoResult,
                type: Type.mediumTitle
              )
            );
          } else {
            return SearchResultList(mushrooms: mushrooms, loadIcon: _hasMore);
          }
        },
      ),
    );
  }
}