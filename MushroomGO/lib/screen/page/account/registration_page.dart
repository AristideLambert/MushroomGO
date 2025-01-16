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
import 'package:mushroom_go/utils/text/password_utils.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final TextEditingController _controllerFirstname;
  late final TextEditingController _controllerName;
  late final TextEditingController _controllerEmail;
  late final TextEditingController _controllerPassword;
  late bool _isValid;
  late Function()? _nextAction;

  @override
  void initState() {
    super.initState();
    _controllerFirstname = TextEditingController();
    _controllerFirstname.addListener((){
      setState(() {
        _isValid = _controllerFirstname.text.isNotEmpty && _controllerName.text.isNotEmpty && _controllerEmail.text.isNotEmpty && PasswordUtils.checkValid(_controllerPassword.text);
      });
    });
    _controllerName = TextEditingController();
    _controllerName.addListener((){
      setState(() {
        _isValid = _controllerFirstname.text.isNotEmpty && _controllerName.text.isNotEmpty && _controllerEmail.text.isNotEmpty && PasswordUtils.checkValid(_controllerPassword.text);
      });
    });
    _controllerEmail = TextEditingController();
    _controllerEmail.addListener((){
      setState(() {
        _isValid = _controllerFirstname.text.isNotEmpty && _controllerName.text.isNotEmpty && _controllerEmail.text.isNotEmpty && PasswordUtils.checkValid(_controllerPassword.text);
      });
    });
    _controllerPassword = TextEditingController();
    _controllerPassword.addListener((){
      setState(() {
        _isValid = _controllerFirstname.text.isNotEmpty && _controllerName.text.isNotEmpty && _controllerEmail.text.isNotEmpty && PasswordUtils.checkValid(_controllerPassword.text);
      });
    });
    _isValid = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _nextAction = ModalRoute.of(context)!.settings.arguments as Function()?;
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
                    const SizedBox(height: DimensionConstant.spaceVerticalRegister,),
                    Icon(MushroomGOFontUtils.logo, color: ColorConstant.textPrimaryColor, size: MediaQuery.of(context).size.width * DimensionConstant.ratioLogoRegister,),
                    const SizedBox(height: DimensionConstant.spaceVerticalRegister,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DimensionConstant.paddingRegister),
                      child: TextOutput(
                        text: AppLocalizations.of(context)!.registerTitle,
                        type: Type.largeTitle,
                        fontColor: ColorConstant.textPrimaryColor,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: DimensionConstant.spaceVerticalRegister,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DimensionConstant.paddingRegister),
                      child: TextOutput(
                        text: AppLocalizations.of(context)!.registerDescription,
                        type: Type.smallTitle,
                        fontColor: ColorConstant.textPrimaryColor,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.center,
                      ),
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
                                  flex: DimensionConstant.flexNameRegister,
                                  child: TextInput(
                                    controller: _controllerFirstname,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    placeHolder: "Aristide",
                                    clearText: true,
                                    title: AppLocalizations.of(context)!.registerFirstName
                                  ),
                                ),
                                const SizedBox(width: DimensionConstant.spaceVerticalRegister,),
                                Expanded(
                                  flex: DimensionConstant.flexNameRegister,
                                  child: TextInput(
                                    controller: _controllerName,
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
                              controller: _controllerEmail,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              placeHolder: "aristide.lambert@student.hepl.be",
                              clearText: true,
                              title: AppLocalizations.of(context)!.registerEmail,
                              autocorrect: false,
                              suggestions: false,
                            ),
                            const SizedBox(height: DimensionConstant.spaceVerticalRegister,),
                            TextInput(
                              controller: _controllerPassword,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              placeHolder: "••••••••••••••",
                              password: true,
                              passwordPolicy: true,
                              title: AppLocalizations.of(context)!.registerPassword,
                              autocorrect: false,
                              suggestions: false,
                            ),
                            const SizedBox(height: DimensionConstant.spaceVerticalRegister,),
                            ButtonStandard(
                              title: AppLocalizations.of(context)!.registerSignUp,
                              enabled: _isValid,
                              onTap: () async {
                                await FirebaseAuthUtils
                                    .createAccount(
                                    context, _controllerFirstname.text,
                                    _controllerName.text, _controllerEmail.text,
                                    _controllerPassword.text, _nextAction);
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
                                    Navigator.of(context).pop();
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
            child: GestureDetector(
              child: const Icon(MushroomGOFontUtils.chevronLeft, color: ColorConstant.textPrimaryColor,),
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