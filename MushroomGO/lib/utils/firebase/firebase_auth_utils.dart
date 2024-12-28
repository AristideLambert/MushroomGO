import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mushroom_go/utils/dialog/dialog_utils.dart';

class FirebaseAuthUtils{
  FirebaseAuthUtils._();

  static Future<void> createUserWithEmailAndPassword(BuildContext context, String firstname, String name, String email, String password) async {
    try {
      if(context.mounted){
        DialogUtils.showLoading(context, "Inscription en cours...");
      }
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
      if (context.mounted){
        DialogUtils.showError(context, "Inscription", errorMessage);
      }
    }
  }

  static Future<void> signInWithEmailAndPassword(BuildContext context, String email, String password) async {
    try {
      if (context.mounted) {
        DialogUtils.showLoading(context, "Identification en cours...");
      }
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
      }
      String errorMessage;
      switch (e.code) {
        case 'invalid-email':
          errorMessage = "L'adresse e-mail est invalide.";
          break;
        case 'user-disabled':
          errorMessage = "Ce compte utilisateur a été désactivé.";
          break;
        case 'user-not-found':
          errorMessage = "Aucun utilisateur trouvé pour cet e-mail.";
          break;
        case 'wrong-password':
          errorMessage = "Mot de passe incorrect.";
          break;
        default:
          errorMessage = "Une erreur inattendue est survenue : ${e.code}.";
      }
      if (context.mounted) {
        DialogUtils.showError(context, "Identification", errorMessage);
      }
    }
  }

  static Future<void> sendPasswordResetEmail(BuildContext context, String email) async {
    try {
      if (context.mounted) {
        DialogUtils.showLoading(context, "Rénitialisation en cours...");
      }
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      if (context.mounted) {
        Navigator.of(context).pop();
        DialogUtils.showInformation(context, "Rénitialisation du mot de passe", "Un mail de rénitialisation vous a été envoyé.\nVérifier votre boite mail.", (){
          Navigator.of(context).pop();
        });
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
      }
      String errorMessage;
      switch (e.code) {
        case 'invalid-email':
          errorMessage = "L'adresse e-mail est invalide.";
          break;
        case 'user-not-found':
          errorMessage = "Aucun utilisateur trouvé pour cet e-mail.";
          break;
        default:
          errorMessage = "Une erreur inattendue est survenue : ${e.code}.";
      }
      if (context.mounted) {
        DialogUtils.showError(context, "Identification", errorMessage);
      }
    }
  }
}