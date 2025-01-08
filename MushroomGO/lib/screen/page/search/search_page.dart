import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/page/search/search_history_page.dart';
import 'package:mushroom_go/screen/page/search/search_result_page.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';
import 'package:mushroom_go/screen/widget/textField/text_input.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';

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
                left: DimensionConstant.defaultPadding,
                right: DimensionConstant.defaultPadding,
                bottom: 12
              ),
              child: Row(
                children: [
                  Expanded(
                      child: TextInput(
                          controller: _controllerSearch,
                          textInputAction: TextInputAction.search,
                          keyboardType: TextInputType.text,
                          placeHolder: "Rechercher un champignon",
                        leftIcon: MushroomGOFontUtils.search,
                        clearText: true,

                      )
                  ),
                  SizedBox(width: DimensionConstant.defaultPadding,),
                  TextOutput(text: "Annuler", fontColor: Theme.of(context).primaryColor,)
                ],
              ),
            ),
            if(_controllerSearch.text.isEmpty) ... [
              Expanded(child: SearchHistoryPage(controllerSearch: _controllerSearch))
            ] else ... [
              Expanded(child: SearchResultPage())
            ]
          ],
        ),
      ),
    );
  }
}
