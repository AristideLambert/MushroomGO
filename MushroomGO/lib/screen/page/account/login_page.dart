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

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _controllerEmail;
  late final TextEditingController _controllerPassword;
  late Function()? _nextAction;
  late bool _isBack;

  @override
  void initState() {
    super.initState();
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();
    _isBack = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _nextAction = ModalRoute.of(context)!.settings.arguments as Function()?;
    _isBack = _nextAction == null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Stack(
            alignment: Alignment.bottomCenter,
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
                                  TextOutput(text: AppLocalizations.of(context)!.loginTitle, type: Type.largeTitle, fontColor: ColorConstant.textLogin,),
                                  const SizedBox(height: DimensionConstant.spaceVerticalLogin,),
                                  TextOutput(text: AppLocalizations.of(context)!.loginDescription, type: Type.smallTitle, fontColor: ColorConstant.textLogin, fontWeight: FontWeight.normal,),
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
                                              controller: _controllerEmail,
                                              textInputAction: TextInputAction.next,
                                              keyboardType: TextInputType.emailAddress,
                                              placeHolder: "aristide.lambert@student.hepl.be",
                                              clearText: true,
                                              title: AppLocalizations.of(context)!.loginEmail
                                          ),
                                          const SizedBox(height: DimensionConstant.spaceVerticalLogin,),
                                          TextInput(
                                              controller: _controllerPassword,
                                              textInputAction: TextInputAction.done,
                                              keyboardType: TextInputType.visiblePassword,
                                              placeHolder: "••••••••••••••",
                                              password: true,
                                              title: AppLocalizations.of(context)!.loginPassword
                                          ),
                                          const SizedBox(height: DimensionConstant.spaceHorizontalLogin,),
                                          Align(
                                              alignment: AlignmentDirectional.centerEnd,
                                              child: TextOutput(text: AppLocalizations.of(context)!.loginForgotPassword, fontColor: ColorConstant.textOnTapLogin, onTap: (){
                                                Navigator.of(context).pushNamed(
                                                    NavigationConstant.forgotPasswordPage
                                                );
                                              }
                                              )
                                          ),
                                          const SizedBox(height: DimensionConstant.spaceVerticalLogin,),
                                          ButtonStandard(title: AppLocalizations.of(context)!.loginLogin, onTap: () async {
                                            await FirebaseAuthUtils.signInAccount(context, _controllerEmail.text, _controllerPassword.text, _nextAction);
                                          }
                                          ),
                                          const SizedBox(height: DimensionConstant.spaceVerticalLogin,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              TextOutput(text: AppLocalizations.of(context)!.loginHaveAccount),
                                              const SizedBox(width: DimensionConstant.spaceHorizontalLogin,),
                                              TextOutput(text: AppLocalizations.of(context)!.loginSignUp, fontColor: ColorConstant.textOnTapLogin, fontWeight: FontWeight.bold, onTap: (){
                                                Navigator.of(context).pushNamed(NavigationConstant.registrationPage);
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
              if(!_isBack) ... [
                SafeArea(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: DimensionConstant.marginLogin),
                      child: TextOutput(text: AppLocalizations.of(context)!.loginSkip, type: Type.mediumTitle, fontColor: ColorConstant.textOnTapLogin, onTap: _nextAction,),
                    )
                )
              ]
            ]
        ),
        if(_isBack) ... [
          SafeArea(
              child: Container(
                  margin: const EdgeInsets.only(
                      left: DimensionConstant.marginRegister,
                      top: DimensionConstant.marginRegister
                  ),
                  // TODO: Update icon
                  child: GestureDetector(child: const Icon(Icons.arrow_back_outlined, color: Colors.white,),
                  onTap: (){
                    Navigator.of(context).pop();
                  },)
              )
          )
        ]
      ]



    );
  }
}