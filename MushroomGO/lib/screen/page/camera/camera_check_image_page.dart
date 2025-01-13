import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/models/mushroom_scan.dart';
import 'package:mushroom_go/models/mushroom_scan_image.dart';
import 'package:mushroom_go/screen/widget/button/standard/button_standard.dart';
import 'package:mushroom_go/utils/api/mushroom_identification_utils.dart';
import 'package:mushroom_go/utils/dialog/dialog_utils.dart';
import 'package:mushroom_go/utils/firebase/firestore_utils.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mushroom_go/utils/mission/mission_utils.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
      if(FirebaseAuth.instance.currentUser != null){
        final MushroomScan? mushroomScan = await FirestoreUtils.addMushroomHistory(context, mushroom, _mushroomScanImage);
        if(mounted){
          await MissionUtils.checkMission(mushroom, context);
        }
        if (!mounted) return;
        Navigator.of(context).pop();
        if(mushroomScan != null){
          Navigator.of(context).pushNamedAndRemoveUntil(NavigationConstant.mushroomDetailPage, ModalRoute.withName(NavigationConstant.mainPage), arguments: mushroomScan);
        } else {
          DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.cameraCheckImageTitle, AppLocalizations.of(context)!.cameraCheckImageErrorAnalyzeTitle, AppLocalizations.of(context)!.popupOK, (){
            Navigator.of(context).pop();
          }, false);
        }
      } else {
        if (!mounted) return;
        Navigator.of(context).pop();
        Navigator.of(context).pushNamedAndRemoveUntil(NavigationConstant.mushroomDetailPage, ModalRoute.withName(NavigationConstant.mainPage), arguments: mushroom.toLowerCase());
      }
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
    return VisibilityDetector(
      onVisibilityChanged: (visibilityInfo) {
        final visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 0) {
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarColor: Colors.black,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
          );
        }
      },
      key: widget.key ?? UniqueKey(),
      child: Scaffold(
        backgroundColor: ColorConstant.backgroundCameraCheckImage,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Center(
                child: Image.file(
                  File(_mushroomScanImage.xFile.path)
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
                child: Row(
                  children: [
                    Expanded(
                      // TODO: Update icon
                      child: ButtonStandard(
                        title: AppLocalizations.of(context)!.cameraCheckImageButtonRetry,
                        icon: Icons.refresh_sharp,
                        onTap: (){
                          Navigator.of(context).pop();
                        }
                      ),
                    ),
                    SizedBox(width: DimensionConstant.defaultPadding),
                    Expanded(
                      child: ButtonStandard(
                        title: AppLocalizations.of(context)!.cameraCheckImageButtonAnalyze,
                        icon: MushroomGOFontUtils.mushroomScan,
                        onTap: (){
                          _analyse();
                        }
                      ),
                    )
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}