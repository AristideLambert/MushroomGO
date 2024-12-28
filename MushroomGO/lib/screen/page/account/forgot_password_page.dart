import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/widget/button/standard/button_standard.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';
import 'package:mushroom_go/screen/widget/textfield/text_input.dart';
import 'package:mushroom_go/utils/firebase/firebase_auth_utils.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordPage extends StatefulWidget {

  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.topLeft,
        children: [
          Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: DimensionConstant.flexTopBackgroundLogin,
                      child: Container(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Expanded(
                      flex: DimensionConstant.flexBottomBackgroundLogin,
                      child: Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ],
                ),
                SafeArea(
                    child: SizedBox(
                        width: double.infinity,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: DimensionConstant.spaceVerticalLogin,),
                              Icon(MushroomGOFontUtils.logo, color: ColorConstant.textLogin, size: MediaQuery.of(context).size.width * 0.20,),
                              const SizedBox(height: DimensionConstant.spaceVerticalLogin,),
                              TextOutput(text: "Reset your password", type: Type.largeTitle, fontColor: ColorConstant.textLogin,),
                              const SizedBox(height: DimensionConstant.spaceVerticalLogin,),
                              TextOutput(text: "Enter your email for reset password", type: Type.smallTitle, fontColor: ColorConstant.textLogin, fontWeight: FontWeight.normal,),
                              const SizedBox(height: DimensionConstant.spaceVerticalLogin + 10,),
                              Card(
                                elevation: DimensionConstant.elevationLogin,
                                color: Theme.of(context).appBarTheme.backgroundColor,
                                margin: const EdgeInsets.symmetric(horizontal: DimensionConstant.marginLogin),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(DimensionConstant.radiusLogin),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(DimensionConstant.paddingLogin),
                                  child: Column(
                                    children: [
                                      TextInput(
                                          controller: controllerEmail,
                                          textInputAction: TextInputAction.next,
                                          keyboardType: TextInputType.emailAddress,
                                          placeHolder: "aristide.lambert@student.hepl.be",
                                          clearText: true,
                                          title: AppLocalizations.of(context)!.loginEmail
                                      ),
                                      const SizedBox(height: DimensionConstant.spaceVerticalLogin,),
                                      ButtonStandard(title: "Réinitialiser", onTap: (){
                                          FirebaseAuthUtils.sendPasswordResetEmail(context, controllerEmail.text);
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
                left: DimensionConstant.marginRegister,
                top: DimensionConstant.marginRegister
              ),
              // TODO: Update icon
              child: GestureDetector(
                child: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.white,
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