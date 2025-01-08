import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/widget/listview/search/search_history_list.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';
import 'package:mushroom_go/utils/search/search_utils.dart';

class SearchHistoryPage extends StatefulWidget {
  final TextEditingController controllerSearch;

  const SearchHistoryPage({super.key, required this.controllerSearch});

  @override
  State<SearchHistoryPage> createState() => _SearchHistoryPageState();
}

class _SearchHistoryPageState extends State<SearchHistoryPage> {
  late bool _hasHistory;
  late Future<List<String>> _history;

  void _loadHistory(){
    setState(() {
      _history = SearchUtils.getHistory();
    });
  }

  @override
  void initState() {
    super.initState();
    _hasHistory = false;
    _loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: DimensionConstant.defaultPadding),
      child: Column(
        children: [
          if(_hasHistory) ... [
            Container(
              alignment: Alignment.centerRight,
              child:
              GestureDetector(
                onTap: () async {
                  await SearchUtils.clearHistory();
                  setState(() {
                    SearchUtils.clearHistory();
                  });
                },
                child: TextOutput(
                  text: "Effacer tout",
                  type: Type.caption,
                  fontColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
          Expanded(
            child: FutureBuilder<List<String>>(
              future: _history,
              builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  _hasHistory = false;
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erreur: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  _hasHistory = false;
                  return Center(child: TextOutput(text: "Aucun historique", type: Type.mediumTitle,));
                } else {
                  _hasHistory = true;
                  return Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: SearchHistoryList(
                      controllerSearch: widget.controllerSearch,
                      history: snapshot.data!,
                      reloadHistory: () => _loadHistory,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
