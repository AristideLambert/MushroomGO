import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http show post;
import 'package:mushroom_go/utils/dialog/dialog_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MushroomIdentificationUtils {
  static const String _apiUrl = "https://mushroom.kindwise.com/api/v1/identification";
  static const String _apiKey = "GzLAZTuJtghThBZmmojt1hMVzPcII1hw3NBEHhECA9zmciY1vh";

  static Future<String?> identifyMushroom(BuildContext context, XFile xFile, {bool isPop = true}) async {
    try {
      if(context.mounted){
        DialogUtils.showLoading(context, AppLocalizations.of(context)!.mushroomIdentificationUtilsIdentifyMushroomInProgressTitle);
      }
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Api-Key': _apiKey,
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "images": ["data:image/jpeg;base64,${base64Encode(await xFile.readAsBytes())}"],
          "similar_images": true,
        }),
      );
      if(context.mounted){
        if(isPop){
          Navigator.of(context).pop();
        }
        if (response.statusCode == 201) {
          final data = jsonDecode(response.body);
          final suggestions = data['result']['classification']['suggestions'];
          if (suggestions != null && suggestions is List && suggestions.isNotEmpty) {
            final filteredSuggestions = suggestions.where((suggestion) {
              return suggestion['probability'] != null && suggestion['probability'] > 0.5;
            }).toList();
            if (filteredSuggestions.isNotEmpty) {
              final bestSuggestion = filteredSuggestions.reduce((current, next) {
                return current['probability'] > next['probability'] ? current : next;
              });
              return bestSuggestion['name'];
            } else {
              DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.mushroomIdentificationUtilsIdentifyMushroomTitle, AppLocalizations.of(context)!.mushroomIdentificationUtilsIdentifyMushroomNoResult, AppLocalizations.of(context)!.popupOK, (){
                Navigator.of(context).pop();
              }, false);
            }
          } else {
            DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.mushroomIdentificationUtilsIdentifyMushroomTitle, AppLocalizations.of(context)!.mushroomIdentificationUtilsIdentifyMushroomNoResult, AppLocalizations.of(context)!.popupOK, (){
              Navigator.of(context).pop();
            }, false);
          }
        } else {
          DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.mushroomIdentificationUtilsIdentifyMushroomTitle, AppLocalizations.of(context)!.mushroomIdentificationUtilsErrorIdentifyMushroom, AppLocalizations.of(context)!.popupOK, null, false);
        }
      }
    } catch (e) {
      if(context.mounted){
        if(isPop){
          Navigator.of(context).pop();
        }
        DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.mushroomIdentificationUtilsIdentifyMushroomTitle, AppLocalizations.of(context)!.mushroomIdentificationUtilsErrorIdentifyMushroom, AppLocalizations.of(context)!.popupOK, null, false);
      }
    }
    if(!context.mounted) return null;
    if(isPop){
      Navigator.of(context).pop();
    }
    return null;
  }
}