import 'package:flutter/material.dart';
import 'package:mushroom_go/screen/widget/listview/search/search_history_list_item.dart';

class SearchHistoryList extends StatefulWidget {
  final TextEditingController controllerSearch;
  final List<String> history;
  final Function() reloadHistory;

  const SearchHistoryList({super.key, required this.controllerSearch, required this.history, required this.reloadHistory});

  @override
  State<SearchHistoryList> createState() => _SearchHistoryListState();
}

class _SearchHistoryListState extends State<SearchHistoryList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.history.length,
      itemBuilder: (BuildContext context, int index) {
        return SearchHistoryListItem(index: index, controllerSearch: widget.controllerSearch, title: widget.history[index], reloadHistory: widget.reloadHistory,);
      },
    );
  }
}
