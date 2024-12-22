import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/widget/button/standard/button_standard.dart';
import 'package:mushroom_go/screen/widget/textfield/text_input.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 9,
              child: Container(
                color: Theme.of(context).primaryColor,
              ),
            ),
            Expanded(
              flex: 11,
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
                          SizedBox(height: 20,),
              Icon(Icons.ac_unit, size: MediaQuery.of(context).size.width * 0.20,),
                          SizedBox(height: 20,),
              Text("Sign in to your account", style: TextStyle(
                color: Colors.white,
                fontSize: DimensionConstant.titleLarge,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),),
                          SizedBox(height: 20,),
                          Text("Enter your email and password to log in", style: TextStyle(
                            color: Colors.white,
                            fontSize: DimensionConstant.titleSmall,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),),
                          SizedBox(height: 30,),
                          Card(
                            margin: EdgeInsets.symmetric(horizontal: 25),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Column(
                                children: [
                                  TextInput(),
                                  SizedBox(height: 25,),
                                  TextInput(),
                                  Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: Text("Forgot password ?"),
                                  ),
                                  SizedBox(height: 25,),
                                  ButtonStandard(title: "Login", onTap: null),
                                  SizedBox(height: 25,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Don't have an account ?"),
                                      SizedBox(width: 10,),
                                      Text("Sign up ?"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 25,),
              ])))]);
  }
}
