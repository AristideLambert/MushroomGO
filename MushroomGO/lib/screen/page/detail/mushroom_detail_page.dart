import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/exception/loading_exception.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:mushroom_go/screen/page/detail/mushroom_detail_content_page.dart';
import 'package:mushroom_go/screen/widget/popup/loading_container.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';
import 'package:mushroom_go/utils/dialog/dialog_utils.dart';
import 'package:mushroom_go/utils/firebase/firestore_utils.dart';

class MushroomDetailPage extends StatefulWidget {
  const MushroomDetailPage({super.key});

  @override
  State<MushroomDetailPage> createState() => _MushroomDetailPageState();
}

class _MushroomDetailPageState extends State<MushroomDetailPage> {
  late bool _isScan;
  late String _name;
  late Mushroom _mushroom;
  late Future<Mushroom?> _loadMushroom;

  void _loadLocalMushroom(Mushroom mushroom) {
    if (!mounted) return;
    setState(() {
      _loadMushroom = Future.value(
          _mushroom = mushroom
      );
    });
  }

  void _loadDBMushroom(String mushroom) {
    if (!mounted) return;
    setState(() {
      _loadMushroom = FirestoreUtils.getMushroomNameScientific(
        context,
        mushroom
      );
    });
    _loadMushroom.then((result) {
      if (!mounted) return;
      if(result == null){
        DialogUtils.showPopupInformation(context, "error", "error", AppLocalizations.of(context)!.popupOK, (){
          //widget.controllerSearch.clear();
        }, false);
      } else {
        setState(() {
          _mushroom = result;
          _name = result.name;
        });
      }
    }).catchError((error) {
      if (!mounted) return;
      if(error is LoadingException){
        DialogUtils.showPopupInformation(context, error.title, error.content, AppLocalizations.of(context)!.popupOK, (){
          //widget.controllerSearch.clear();
        }, false);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isScan = false;
    Object? argument = ModalRoute.of(context)!.settings.arguments;
    if(argument is Mushroom){
      _name = argument.name;
      _loadLocalMushroom(argument);
    } else if(argument is String) {
      _isScan = true;
      _name = "";
      _loadDBMushroom(argument);
    } else {
      DialogUtils.showPopupInformation(context, "Erreur", "content", "OK", (){
        Navigator.of(context).pop();
      }, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(_name),
      ),
      body: FutureBuilder<Mushroom?>(
          future: _loadMushroom,
          builder: (BuildContext context, AsyncSnapshot<Mushroom?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Transform.translate(
                offset: Offset(0, -appBarHeight),
                child: LoadingContainer(message: /*AppLocalizations.of(context)!.searchResultInProgressTitle*/"Chargement..."));
            } else if (snapshot.hasError) {
              return Container();
            } else if (!snapshot.hasData) {
              return Center(
                child: TextOutput(
                  text: AppLocalizations.of(context)!.searchResultTitleNoResult,
                  type: Type.mediumTitle
                )
              );
            } else {
              return MushroomDetailContentPage(mushroom: _mushroom, onRefresh: () async {
                _loadDBMushroom(_mushroom.scientificName);
              },);//SearchResultList(mushrooms: mushrooms, loadIcon: _hasMore);
            }
          },
        ),
    );
  }
}
