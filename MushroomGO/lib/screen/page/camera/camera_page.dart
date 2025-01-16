import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/models/mushroom_scan_image.dart';
import 'package:mushroom_go/screen/widget/popup/loading_container.dart';
import 'package:mushroom_go/utils/dialog/dialog_utils.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mushroom_go/utils/map/location_utils.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late double _cameraAspectRatio;
  late FlashMode _flashMode;
  late Future<void> _initializeController;
  late bool _isLocation;
  late bool _isInitialize;

  Future<void> _setup() async {
    try {
      final cameras = await availableCameras();
      final camera = cameras.first;
      _flashMode = FlashMode.auto;
      _isInitialize = false;
      _controller = CameraController(
        camera,
        ResolutionPreset.high,
        enableAudio: false
      );
      await _controller.initialize();
      await _controller.lockCaptureOrientation(DeviceOrientation.portraitUp);
      await _controller.setFlashMode(_flashMode);
      if (!mounted) return;
      final size = _controller.value.previewSize!;
      _cameraAspectRatio = Platform.isAndroid ? size.width / size.height : size.height / size.width;
      _isInitialize = true;
      setState(() {});
    } catch (e) {
      if(!mounted) return;
      DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.cameraTitle, AppLocalizations.of(context)!.cameraErrorLoadTitle, AppLocalizations.of(context)!.popupOK, (){
        Navigator.of(context).pop();
      }, false);
    }
  }

  void _setupFlashMode(){
    switch(_flashMode){
      case FlashMode.auto:
        _flashMode = FlashMode.always;
        break;
      case FlashMode.always:
        _flashMode = FlashMode.off;
        break;
      case FlashMode.off:
        _flashMode = FlashMode.auto;
        break;
      default:
        _flashMode = FlashMode.auto;
    }
    _controller.setFlashMode(_flashMode);
    setState(() {});
  }

  Future<void> _setupLocation() async {
    if(_isLocation){
      _isLocation = false;
    } else {
      if (await LocationUtils.isEnable()) {
        bool permission = true;
        String error;
        switch (await LocationUtils.checkPermission()) {
          case LocationPermission.deniedForever:
            if(!mounted) return;
            error = AppLocalizations.of(context)!.cameraErrorLocationDeniedForeverTitle;
            permission = false;
            break;
          case LocationPermission.denied:
            if(!mounted) return;
            error = AppLocalizations.of(context)!.cameraErrorLocationDeniedTitle;
            permission = false;
            break;
          default:
            error = "";
            permission = true;
        }
        if (permission) {
          _isLocation = true;
        } else {
          if(!mounted) return;
          DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.cameraTitle, error, AppLocalizations.of(context)!.popupOK, (){
            Navigator.of(context).pop();
          }, false);
        }
      } else {
        if(!mounted) return;
        DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.cameraTitle, AppLocalizations.of(context)!.cameraErrorLocationDeniedTitle, AppLocalizations.of(context)!.popupOK, (){
          Navigator.of(context).pop();
        }, false);
      }
    }
    setState(() {});
  }

  Future<void> _takePicture() async {
    try {
      Navigator.of(context).pushNamed(NavigationConstant.cameraCheckImagePage, arguments: MushroomScanImage(xFile: await _controller.takePicture(), dateTime: DateTime.now(), position: _isLocation ? await LocationUtils.getCurrentLocation() : null));
    } catch (e) {
      if(!mounted) return;
      DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.cameraTitle, AppLocalizations.of(context)!.cameraErrorTakeTitle, AppLocalizations.of(context)!.popupOK, (){
        Navigator.of(context).pop();
      }, false);
    }
  }

  @override
  void initState() {
    super.initState();
    _isInitialize = false;
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (!_isInitialize) {
      _initializeController = _setup();
    }
    final locationPermission = await LocationUtils.checkPermission();
    _isLocation = locationPermission != LocationPermission.denied && locationPermission != LocationPermission.deniedForever;
  }

  @override
  void dispose() {
    if (_controller.value.isInitialized) {
      _controller.dispose();
    }
    _isInitialize = false;
    super.dispose();
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
        backgroundColor: ColorConstant.backgroundCamera,
        body: SafeArea(
          child: FutureBuilder<void>(
            future: _initializeController,
            builder: (BuildContext context, AsyncSnapshot<void> snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingContainer(message: AppLocalizations.of(context)!.cameraInProgressTitle);
              } else if (snapshot.hasError || !_isInitialize) {
                return Container();
              } else {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(DimensionConstant.defaultPadding),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              MushroomGOFontUtils.close,
                              color: ColorConstant.iconCamera,
                            )
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: (){
                              _setupLocation();
                            },
                            child: Icon(
                              _isLocation ?
                              MushroomGOFontUtils.locationOn :
                              MushroomGOFontUtils.locationOff,
                              color: ColorConstant.iconCamera,
                            )
                          ),
                          SizedBox(width: DimensionConstant.defaultPadding),
                          GestureDetector(
                            onTap: (){
                              _setupFlashMode();
                            },
                            child: Icon(
                              _flashMode == FlashMode.auto ?
                              MushroomGOFontUtils.flashAutomatic :
                              _flashMode == FlashMode.always ?
                              MushroomGOFontUtils.flashOn :
                              MushroomGOFontUtils.flashOff,
                              color: ColorConstant.iconCamera,
                            )
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: RotatedBox(
                        quarterTurns: Platform.isAndroid ? 1 : 0,
                        child: AspectRatio(
                          aspectRatio: _cameraAspectRatio,
                          child: CameraPreview(
                            _controller,
                          ),
                        ),
                      ),
                    ),
                  ]
                );
              }
            }
          )
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _isInitialize ? Padding(
          padding: const EdgeInsets.all(DimensionConstant.iconPaddingCamera),
          child: GestureDetector(
            onTap: () async {
              _takePicture();
            },
            child: Icon(
              MushroomGOFontUtils.cameraTake,
              size: DimensionConstant.iconSizeCamera,
              color: ColorConstant.iconCamera,
            )
          ),
        ) : null,
      ),
    );
  }
}