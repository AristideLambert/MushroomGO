import 'package:flutter/material.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';
import 'package:mushroom_go/theme/search_history_list_theme.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';
import 'package:mushroom_go/utils/search/search_utils.dart';

class SearchHistoryListItem extends StatelessWidget {
  final int index;
  final TextEditingController controllerSearch;
  final String title;
  final Function() reloadHistory;
  final SearchHistoryListTheme theme;

  const SearchHistoryListItem({super.key, required this.index, required this.controllerSearch, required this.title, required this.reloadHistory, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.only(
        top: index == 0 ? 0 : theme.padding,
        bottom: theme.padding
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                controllerSearch.text = title;
              },
              child: Row(
                children: [
                  Icon(
                    MushroomGOFontUtils.history,
                    size: theme.sizeLeftIcon,
                    color: theme.colorLeftIcon,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: theme.padding),
                      child: TextOutput(text: title),
                    )
                  ),
                ],
              ),
            )
          ),
          GestureDetector(
            onTap: () {
              SearchUtils.removeHistory(title).then((_)=> reloadHistory.call());
            },
            child: Icon(
              MushroomGOFontUtils.close,
              size: theme.sizeRightIcon
            )
          )
        ],
      )
    );
  }
}