import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
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
  Future<void>? _signUpFuture;

  Future<void> test() async {
    FirebaseFirestore.instance.collection("user").doc("xvDSWKO6utRnGsxOGoWsXE5eEKp1").get().then((onValue){
      print(onValue.data());
    });
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      // Empêche la fermeture du popup en cliquant à l'extérieur
      builder: (BuildContext context) {
        return Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Text("Chargement..."),
          ),
        );
      },
    );
  }

  Future<void> signUpAndSaveUser(BuildContext context) async {
    try {
      // Afficher le dialogue de chargement
      showLoadingDialog(context);

      // Création de l'utilisateur avec FirebaseAuth
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: controllerEmail.text.trim(),
        password: controllerPassword.text.trim(),
      );

      // Enregistrement des informations dans Firestore
      await FirebaseFirestore.instance
          .collection("user")
          .doc(userCredential.user?.uid)
          .set({
        "firstname": controllerFirstname.text.trim(),
        "name": controllerName.text.trim(),
      });

      // Masquer le dialogue de chargement
      Navigator.of(context).pop();

      // Afficher un message de succès
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Succès"),
            content: Text("Inscription réussie !"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      // Fermer le dialogue en cas d'erreur
      Navigator.of(context).pop();

      // Gérer les erreurs
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = "Cet e-mail est déjà utilisé.";
          break;
        case 'invalid-email':
          errorMessage = "L'adresse e-mail est invalide.";
          break;
        case 'weak-password':
          errorMessage = "Le mot de passe est trop faible.";
          break;
        default:
          errorMessage = "Une erreur inconnue s'est produite.";
      }

      // Afficher un message d'erreur
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Erreur"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } catch (e) {
      // Fermer le dialogue en cas d'erreur générique
      Navigator.of(context).pop();

      // Afficher un message d'erreur générique
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Erreur"),
            content: Text("Une erreur s'est produite : $e"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }


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
                                  /*showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      context = context;
                                      return Center(
                                        child: Container(height: 100,child: Text("data"), color: Colors.red,),
                                      );
                                    },
                                  );*/

                                  //signUpAndSaveUser(context);
                                  FirebaseAuthUtils.createUserWithEmailAndPassword(context, controllerFirstname.text, controllerName.text, controllerEmail.text, controllerPassword.text);
















                                  /*
                                  // TODO: Sign up
                                  print("Sign up");
                                  try{
                                    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: controllerEmail.text, password: controllerPassword.text).then(
                                        FirebaseFirestore.instance.collection("user").doc(FirebaseAuth.instance.currentUser?.uid).set({"firsname": controllerFirstname.text, "name": controllerName.text}) as FutureOr Function(UserCredential value)
                                    );
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      print('The password provided is too weak.');
                                    } else if (e.code == 'email-already-in-use') {
                                      print('The account already exists for that email.');
                                    }
                                    print(e.code);
                                  }
                                  print(FirebaseAuth.instance.currentUser);

      */
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
                                      test();
                                      // TODO: Register
                                      /*Navigator.of(widget.mainContext).pushNamed(
                                        NavigationConstant.registrationPage
                                        );*/
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