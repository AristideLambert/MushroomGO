import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/screen/widget/button/standard/button_standard.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';
import 'package:mushroom_go/screen/widget/textfield/text_input.dart';
import 'package:mushroom_go/utils/firebase/firebase_auth_utils.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController controllerFirstname = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

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
                    flex: DimensionConstant.flexTopBackgroundRegister,
                    child: Container(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Expanded(
                    flex: DimensionConstant.flexBottomBackgroundRegister,
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
                      const SizedBox(height: DimensionConstant.spaceVerticalRegister,),
                      Icon(MushroomGOFontUtils.logo, color: ColorConstant.textRegister, size: MediaQuery.of(context).size.width * 0.20,),
                      const SizedBox(height: DimensionConstant.spaceVerticalRegister,),
                      TextOutput(
                        text: AppLocalizations.of(context)!.registerTitle,
                        type: Type.largeTitle,
                        fontColor: ColorConstant.textRegister,
                      ),
                      const SizedBox(height: DimensionConstant.spaceVerticalRegister,),
                      TextOutput(
                        text: AppLocalizations.of(context)!.registerDescription,
                        type: Type.smallTitle,
                        fontColor: ColorConstant.textRegister,
                        fontWeight: FontWeight.normal,
                      ),
                      const SizedBox(height: DimensionConstant.spaceVerticalRegister + 10,),
                      Card(
                        elevation: DimensionConstant.elevationRegister,
                        color: Theme.of(context).appBarTheme.backgroundColor,
                        margin: const EdgeInsets.symmetric(horizontal: DimensionConstant.marginRegister),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(DimensionConstant.radiusRegister),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(DimensionConstant.paddingRegister),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: TextInput(
                                      controller: controllerFirstname,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.text,
                                      placeHolder: "Aristide",
                                      clearText: true,
                                      title: AppLocalizations.of(context)!.registerFirstName
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Expanded(
                                    flex: 5,
                                    child: TextInput(
                                      controller: controllerName,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.text,
                                      placeHolder: "LAMBERT",
                                      clearText: true,
                                      title: AppLocalizations.of(context)!.registerName
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: DimensionConstant.spaceVerticalRegister,),
                              TextInput(
                                controller: controllerEmail,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                placeHolder: "aristide.lambert@student.hepl.be",
                                clearText: true,
                                title: AppLocalizations.of(context)!.registerEmail
                              ),
                              const SizedBox(height: DimensionConstant.spaceVerticalRegister,),
                              TextInput(
                                controller: controllerPassword,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.visiblePassword,
                                placeHolder: "••••••••••••••",
                                password: true,
                                passwordPolicy: true,
                                title: AppLocalizations.of(context)!.registerPassword
                              ),
                              const SizedBox(height: DimensionConstant.spaceVerticalRegister,),
                              ButtonStandard(
                                title: AppLocalizations.of(context)!.registerSignUp,
                                onTap: () {
                                  FirebaseAuthUtils
                                      .createUserWithEmailAndPassword(
                                      context, controllerFirstname.text,
                                      controllerName.text, controllerEmail.text,
                                      controllerPassword.text);
                                  Navigator.of(context).pop();
                                  // TODO: Sign up
                                }
                              ),
                              const SizedBox(height: DimensionConstant.spaceVerticalRegister,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextOutput(text: AppLocalizations.of(context)!.registerHaveAccount),
                                  const SizedBox(width: DimensionConstant.spaceHorizontalRegister,),
                                  TextOutput(
                                    text: AppLocalizations.of(context)!.registerLogin,
                                    fontColor: ColorConstant.textOnTapRegister,
                                    fontWeight: FontWeight.bold,
                                    onTap: (){
                                      Navigator.of(context).pushNamed(NavigationConstant.registrationPage);
                                      // TODO: Register
                                    },
                                  )
                                ],
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
              child: const Icon(Icons.arrow_back_outlined, color: Colors.white,)
            )
          ),
        ]
    );
  }
}