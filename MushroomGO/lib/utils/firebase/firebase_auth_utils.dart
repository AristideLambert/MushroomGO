import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mushroom_go/utils/dialog/dialog_utils.dart';

class FirebaseAuthUtils{
  FirebaseAuthUtils._();

  static Future<void> createUserWithEmailAndPassword(BuildContext context, String firstname, String name, String email, String password) async {
    try {
      DialogUtils.showLoading(context, "Inscription en cours...");
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance.collection("user").doc(userCredential.user?.uid).set({
        "firstname": firstname,
        "name": name,
      });
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }  on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
      }
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
      DialogUtils.showError(context, "Inscription", errorMessage);
    }






  }

}