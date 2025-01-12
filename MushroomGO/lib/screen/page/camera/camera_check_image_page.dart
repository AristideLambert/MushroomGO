import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/models/mushroom_scan_image.dart';
import 'package:mushroom_go/screen/widget/button/standard/button_standard.dart';
import 'package:mushroom_go/utils/api/mushroom_identification_utils.dart';
import 'package:mushroom_go/utils/dialog/dialog_utils.dart';
import 'package:mushroom_go/utils/firebase/firestore_utils.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mushroom_go/utils/mission/mission_utils.dart';

class CameraCheckImagePage extends StatefulWidget {
  const CameraCheckImagePage({super.key});

  @override
  State<CameraCheckImagePage> createState() => _CameraCheckImagePageState();
}

class _CameraCheckImagePageState extends State<CameraCheckImagePage> {
  late MushroomScanImage _mushroomScanImage;

  Future<void> _analyse() async {
    final String? mushroom = await MushroomIdentificationUtils.identifyMushroom(context, _mushroomScanImage.xFile, isPop: false);
    if (!mounted) return;
    if(mushroom != null){
      if(FirebaseAuth.instance.currentUser == null){
        await Navigator.of(context).pushNamed(NavigationConstant.benefitAccountPage, arguments: true);
        if (!mounted) return;
      }
      if (FirebaseAuth.instance.currentUser != null) {
        await MissionUtils.checkMission(mushroom, context);
        if (mounted) {
          await FirestoreUtils.addMushroomHistory(context, mushroom, _mushroomScanImage);
        }
      }
      if (!mounted) return;
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(NavigationConstant.mushroomDetailPage, arguments: mushroom.toLowerCase());
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Object? argument = ModalRoute.of(context)!.settings.arguments;
    if(argument is MushroomScanImage){
      _mushroomScanImage = argument;
    } else {
      DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.cameraCheckImageTitle, AppLocalizations.of(context)!.cameraCheckImageErrorTitle, AppLocalizations.of(context)!.popupOK, (){
        Navigator.of(context).pop();
      }, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Center(
                  child: Image.file(
                    File(_mushroomScanImage.xFile.path)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
                  child: ButtonStandard(title: AppLocalizations.of(context)!.cameraCheckImageButtonAnalyze, widthContent: true, icon: MushroomGOFontUtils.mushroomScan, onTap: (){
                    _analyse();
                  }),
                )
              ]
            ),
            Padding(
              padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
              child: ButtonStandard(title: AppLocalizations.of(context)!.cameraCheckImageButtonRetry, widthContent: true, icon: Icons.refresh_sharp, onTap: (){
                Navigator.of(context).pop();
              }),
            )
          ]
        ),
      ),
    );
  }
}