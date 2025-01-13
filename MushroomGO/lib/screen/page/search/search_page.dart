import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/page/search/search_history_page.dart';
import 'package:mushroom_go/screen/page/search/search_result_page.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';
import 'package:mushroom_go/screen/widget/textField/text_input.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';
import 'package:mushroom_go/utils/search/history/search_history_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController _controllerSearch;

  @override
  void initState() {
    super.initState();
    _controllerSearch = TextEditingController();
    _controllerSearch.addListener((){
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: DimensionConstant.defaultPadding,
                left: DimensionConstant.defaultPadding,
                right: DimensionConstant.defaultPadding,
                bottom: DimensionConstant.defaultPadding - DimensionConstant.defaultPadding / 4
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextInput(
                      controller: _controllerSearch,
                      textInputAction: TextInputAction.search,
                      keyboardType: TextInputType.text,
                      placeHolder: AppLocalizations.of(context)!.searchTextInputPlaceHolder,
                      leftIcon: MushroomGOFontUtils.search,
                      clearText: true,
                      onTapOutside: (search){
                        SearchHistoryUtils.addToHistory(search);
                      },
                      onSubmitted: (search){
                        SearchHistoryUtils.addToHistory(search);
                      },
                    )
                  ),
                  SizedBox(width: DimensionConstant.defaultPadding,),
                  TextOutput(
                    text: AppLocalizations.of(context)!.searchButtonCancel,
                    fontColor: Theme.of(context).primaryColor,
                    onTap: () {
                      Navigator.of(context).pop();
                    }
                  )
                ],
              ),
            ),
            if(_controllerSearch.text.isEmpty) ... [
              Expanded(child: SearchHistoryPage(controllerSearch: _controllerSearch))
            ] else ... [
              Expanded(child: SearchResultPage(controllerSearch: _controllerSearch))
            ]
          ],
        ),
      ),
    );
  }
}