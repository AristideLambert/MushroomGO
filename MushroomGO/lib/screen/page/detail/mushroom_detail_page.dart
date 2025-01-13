import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mushroom_go/exception/loading_exception.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:mushroom_go/models/mushroom_scan.dart';
import 'package:mushroom_go/screen/page/detail/mushroom_detail_content_page.dart';
import 'package:mushroom_go/screen/widget/popup/loading_container.dart';
import 'package:mushroom_go/screen/widget/popup/loading_error_container.dart';
import 'package:mushroom_go/utils/dialog/dialog_utils.dart';
import 'package:mushroom_go/utils/firebase/firestore_utils.dart';
import 'package:mushroom_go/utils/text/string_utils.dart';

class MushroomDetailPage extends StatefulWidget {
  const MushroomDetailPage({super.key});

  @override
  State<MushroomDetailPage> createState() => _MushroomDetailPageState();
}

class _MushroomDetailPageState extends State<MushroomDetailPage> {
  late String _name;
  late Mushroom? _mushroom;
  late MushroomScan? _mushroomScan;
  late Future<Object?> _loadMushroom;

  void _loadLocalMushroom(Object mushroom) {
    if (!mounted) return;
    setState(() {
      if(mushroom is Mushroom){
        _loadMushroom = Future.value(
          _mushroom = mushroom,
        );
      } else if (mushroom is MushroomScan){
        _loadMushroom = Future.value(
          _mushroomScan = mushroom,
        );
      }
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
        throw LoadingException(AppLocalizations.of(context)!.mushroomDetailTitle, AppLocalizations.of(context)!.mushroomDetailErrorNotFoundTitle);
      } else {
        setState(() {
          _mushroom = result as Mushroom?;
          _name = _mushroom!.scientificName;
        });
      }
    });
  }

  Widget _error(double height){
    return Transform.translate(
      offset: Offset(0, -height),
      child: LoadingErrorContainer(
        message: AppLocalizations.of(context)!.mushroomDetailErrorNotLoadTitle,
        onReload: (){
          _loadDBMushroom(_name);
        }
      )
    );
  }

  @override
  void initState() {
    super.initState();
    _mushroom = null;
    _mushroomScan = null;
    _loadMushroom = Future.value();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Object? argument = ModalRoute.of(context)!.settings.arguments;
    if(argument is Mushroom){
      _name = argument.scientificName.toLowerCase();
      _loadLocalMushroom(argument);
    } else if(argument is MushroomScan) {
      _name = argument.scientificName.toLowerCase();
      if(argument.mushroom != null){
        _loadLocalMushroom(argument);
      } else {
        DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.mushroomDetailTitle, AppLocalizations.of(context)!.mushroomDetailErrorNotFoundTitle, AppLocalizations.of(context)!.popupOK, (){
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        }, false);
      }
    } else if(argument is String) {
      _name = "";
      _loadDBMushroom(argument);
    } else {
      DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.mushroomDetailTitle, AppLocalizations.of(context)!.mushroomDetailErrorNotFoundTitle, AppLocalizations.of(context)!.popupOK, (){
        Navigator.of(context).pop();
      }, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(StringUtils.capitalizeEachWord(_name)),
      ),
      body: FutureBuilder<Object?>(
        future: _loadMushroom,
        builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Transform.translate(
              offset: Offset(0, -appBarHeight),
              child: LoadingContainer(message: AppLocalizations.of(context)!.mushroomDetailInProgressTitle));
          } else if (snapshot.hasError) {
            return _error(appBarHeight);
          } else if (!snapshot.hasData) {
            return _error(appBarHeight);
          } else {
            if(_mushroomScan != null) {
              return MushroomDetailContentPage(mushroom: _mushroom ?? _mushroomScan!.mushroom!, onRefresh: () async {
                _mushroom = null;
                _loadDBMushroom(_name);
              }, mushroomScan: _mushroomScan!);
            } else {
              return MushroomDetailContentPage(mushroom: _mushroom!, onRefresh: () async {
                _loadDBMushroom(_name);
              });
            }
          }
        },
      ),
    );
  }
}
