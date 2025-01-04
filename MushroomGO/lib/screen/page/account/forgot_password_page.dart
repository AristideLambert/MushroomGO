import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/background/account_background.dart';
import 'package:mushroom_go/screen/widget/button/standard/button_standard.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';
import 'package:mushroom_go/screen/widget/textField/text_input.dart';
import 'package:mushroom_go/utils/firebase/firebase_auth_utils.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordPage extends StatefulWidget {

  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final TextEditingController _controllerEmail;
  late bool _isValid;

  @override
  void initState() {
    super.initState();
    _controllerEmail = TextEditingController();
    _controllerEmail.addListener((){
      setState(() {
        _isValid = _controllerEmail.text.isNotEmpty;
      });
    });
    _isValid = false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Stack(
          children: [
            const AccountBackground(),
            SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: DimensionConstant.spaceVerticalForgotPassword,),
                    Icon(MushroomGOFontUtils.logo, color: ColorConstant.textPrimaryColor, size: MediaQuery.of(context).size.width * DimensionConstant.ratioLogoForgotPassword,),
                    const SizedBox(height: DimensionConstant.spaceVerticalForgotPassword,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DimensionConstant.paddingForgotPassword),
                      child: TextOutput(
                        text: AppLocalizations.of(context)!.forgotPasswordTitle,
                        type: Type.largeTitle,
                        fontColor: ColorConstant.textPrimaryColor,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: DimensionConstant.spaceVerticalForgotPassword,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DimensionConstant.paddingForgotPassword),
                      child: TextOutput(
                        text: AppLocalizations.of(context)!.forgotPasswordDescription,
                        type: Type.smallTitle,
                        fontColor: ColorConstant.textPrimaryColor,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: DimensionConstant.spaceVerticalForgotPassword + 10,),
                    Card(
                      elevation: DimensionConstant.elevationForgotPassword,
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      margin: const EdgeInsets.symmetric(horizontal: DimensionConstant.marginForgotPassword),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(DimensionConstant.radiusForgotPassword),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(DimensionConstant.paddingForgotPassword),
                        child: Column(
                          children: [
                            TextInput(
                              controller: _controllerEmail,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              placeHolder: "aristide.lambert@student.hepl.be",
                              clearText: true,
                              title: AppLocalizations.of(context)!.loginEmail,
                              autocorrect: false,
                              suggestions: false,
                            ),
                            const SizedBox(height: DimensionConstant.spaceVerticalForgotPassword),
                            ButtonStandard(
                              title: AppLocalizations.of(context)!.forgotPasswordButton,
                              enabled: _isValid,
                              onTap: () async {
                                await FirebaseAuthUtils.sendPasswordResetEmailAccount(context, _controllerEmail.text);
                              }
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]
                )
              )
            )
          ]
        ),
        SafeArea(
          child: Container(
            margin: const EdgeInsets.only(
              left: DimensionConstant.marginForgotPassword,
              top: DimensionConstant.marginForgotPassword
            ),
            // TODO: Update icon
            child: GestureDetector(
              child: const Icon(
                Icons.arrow_back_outlined,
                color: ColorConstant.textPrimaryColor,
              ),
              onTap: (){
                Navigator.of(context).pop();
              },
            )
          )
        ),
      ]
    );
  }
}