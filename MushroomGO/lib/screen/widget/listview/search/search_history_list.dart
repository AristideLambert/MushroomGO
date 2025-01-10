import 'package:flutter/material.dart';
import 'package:mushroom_go/screen/widget/listview/search/search_history_list_item.dart';
import 'package:mushroom_go/theme/search_history_list_theme.dart';

class SearchHistoryList extends StatefulWidget {
  final TextEditingController controllerSearch;
  final List<String> history;
  final Function() reloadHistory;
  final SearchHistoryListTheme? theme;

  const SearchHistoryList({super.key, required this.controllerSearch, required this.history, required this.reloadHistory, this.theme});

  @override
  State<SearchHistoryList> createState() => _SearchHistoryListState();
}

class _SearchHistoryListState extends State<SearchHistoryList> {
  late final List<String> _history;
  late SearchHistoryListTheme _theme;

  @override
  void initState() {
    super.initState();
    _history = widget.history.reversed.toList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = widget.theme ?? Theme.of(context).extension<SearchHistoryListTheme>()!;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.history.length,
      itemBuilder: (BuildContext context, int index) {
        return SearchHistoryListItem(index: index, controllerSearch: widget.controllerSearch, title: _history[index], reloadHistory: widget.reloadHistory, theme: _theme);
      },
    );
  }
}
