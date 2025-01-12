import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/widget/listview/search/search_history_list.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';
import 'package:mushroom_go/utils/search/history/search_history_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchHistoryPage extends StatefulWidget {
  final TextEditingController controllerSearch;

  const SearchHistoryPage({super.key, required this.controllerSearch});

  @override
  State<SearchHistoryPage> createState() => _SearchHistoryPageState();
}

class _SearchHistoryPageState extends State<SearchHistoryPage> {
  late Future<List<String>> _history;

  void _loadHistory(){
    setState(() {
      _history = SearchHistoryUtils.getHistory();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: DimensionConstant.defaultPadding),
      child: FutureBuilder<List<String>>(
        future: _history,
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: TextOutput(
                text: AppLocalizations.of(context)!.searchHistoryTitleNoHistory,
                type: Type.mediumTitle
              )
            );
          } else {
            return Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child:  TextOutput(
                    text: AppLocalizations.of(context)!.searchHistoryButtonDelete,
                    type: Type.caption,
                    fontColor: Theme.of(context).primaryColor,
                    onTap: () async {
                      await SearchHistoryUtils.clearHistory();
                      _loadHistory();
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: DimensionConstant.defaultPadding / 2),
                    child: SearchHistoryList(
                      controllerSearch: widget.controllerSearch,
                      history: snapshot.data!,
                      reloadHistory: () => _loadHistory(),
                    ),
                  )
                )
              ],
            );
          }
        },
      )
    );
  }
}