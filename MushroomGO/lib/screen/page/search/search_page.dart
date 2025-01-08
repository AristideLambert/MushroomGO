import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: DimensionConstant.defaultPadding),
              child: Row(
                children: [
                  Expanded(
                      child: TextInput(
                          controller: _controllerSearch,
                          textInputAction: TextInputAction.search,
                          keyboardType: TextInputType.text,
                          placeHolder: "Rechercher un champignon",
                        leftIcon: MushroomGOFontUtils.search,

                      )
                  ),
                  SizedBox(width: DimensionConstant.defaultPadding,),
                  TextOutput(text: "Annuler", fontColor: Theme.of(context).primaryColor,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
