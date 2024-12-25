import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/widget/button/standard/button_standard.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';
import 'package:mushroom_go/screen/widget/textfield/text_input.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    Icon(MushroomGOFontUtils.mushroomScan, color: ColorConstant.textLogin, size: MediaQuery.of(context).size.width * 0.20,),
                    const SizedBox(height: DimensionConstant.spaceVerticalLogin,),
                    const TextOutput(text: "Sign in to your account", type: Type.largeTitle, fontColor: ColorConstant.textLogin,),
                    const SizedBox(height: DimensionConstant.spaceVerticalLogin,),
                    const TextOutput(text: "Enter your email and password to log in", type: Type.smallTitle, fontColor: ColorConstant.textLogin, fontWeight: FontWeight.normal,),
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
                              title: "Email"
                            ),
                            const SizedBox(height: DimensionConstant.spaceVerticalLogin,),
                            TextInput(
                              controller: controllerPassword,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              placeHolder: "••••••••••••••",
                              password: true,
                              title: "Password"
                            ),
                            const SizedBox(height: DimensionConstant.spaceHorizontalLogin,),
                            Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: TextOutput(text: "Forgot password ?", fontColor: ColorConstant.textOnTapLogin, onTap: (){
                                  // TODO: Password recovery
                                  print("Forgot password");
                                }
                              )
                            ),
                            const SizedBox(height: DimensionConstant.spaceVerticalLogin,),
                            ButtonStandard(title: "Login", onTap: (){
                                // TODO: Login
                                print("Login");
                              }
                            ),
                            const SizedBox(height: DimensionConstant.spaceVerticalLogin,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const TextOutput(text: "Don't have an account ?"),
                                const SizedBox(width: DimensionConstant.spaceHorizontalLogin,),
                                TextOutput(text: "Sign up", fontColor: ColorConstant.textOnTapLogin, fontWeight: FontWeight.bold, onTap: (){
                                    // TODO: Register
                                    print("Sign up");
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
            margin: const EdgeInsets.only(bottom: DimensionConstant.marginLogin),
            child: const TextOutput(text: "Skip", type: Type.mediumTitle, fontColor: ColorConstant.textOnTapLogin,),
          )
        ),
      ]
    );
  }
}