import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';
import 'package:mushroom_go/utils/search/search_utils.dart';

class SearchHistoryListItem extends StatelessWidget {
  final int index;
  final TextEditingController controllerSearch;
  final String title;
  final Function() reloadHistory;

  const SearchHistoryListItem({super.key, required this.index, required this.controllerSearch, required this.title, required this.reloadHistory});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:EdgeInsets.only(
            top: index == 0 ? 0 : 8,
            bottom: 8),
        child: Row(
          children: [
            Expanded(
                child:

                GestureDetector(
                  onTap: () {
                    controllerSearch.text = title;
                  },
                  child: Row(
                    children: [
                      Icon(MushroomGOFontUtils.history, size: DimensionConstant.captionText,),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextOutput(text: title),
                      )),
                    ],
                  ),
                )),
            GestureDetector(
                onTap: () {
                  SearchUtils.removeHistory(title).then((_)=> reloadHistory);
                },
                child: Icon(MushroomGOFontUtils.close, size: DimensionConstant.captionText))
          ],
        )
    );
  }
}
