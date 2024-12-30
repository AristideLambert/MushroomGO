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
      userCredential.user?.updateDisplayName("$firstname $name");
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
        DialogUtils.showError(context, "Inscription", errorMessage, null);
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
        DialogUtils.showError(context, "Identification", errorMessage, null);
      }
    }
  }

  static Future<void> sendPasswordResetEmail(BuildContext context, String email) async {
    try {
      if (context.mounted) {
        DialogUtils.showLoading(context, "Réinitialisation en cours...");
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
        DialogUtils.showError(context, "Réinitialisation", errorMessage, null);
      }
    }
  }

  static Future<void> confirmPasswordReset(BuildContext context, String oobCode, String newPassword) async {
    try {
      if (context.mounted) {
        DialogUtils.showLoading(context, "Réinitialisation en cours...");
      }
      await FirebaseAuth.instance.confirmPasswordReset(code: oobCode, newPassword: newPassword);
      if (context.mounted) {
        Navigator.of(context).pop();
        DialogUtils.showInformation(context, "Réinitialisation du mot de passe", "Le mot de passe a été réinitialisé avec succès.", (){
          Navigator.of(context).pop();
        });
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
      }
      String errorMessage;
      switch (e.code) {
        case 'expired-action-code':
          errorMessage = "Le lien de réinitialisation a expiré.";
          break;
        case 'invalid-action-code':
          errorMessage = "Le code de réinitialisation est invalide.";
          break;
        case 'weak-password':
          errorMessage = "Le nouveau mot de passe est trop faible.";
          break;
        default:
          errorMessage = "Une erreur inattendue est survenue : ${e.code}.";
      }
      if (context.mounted) {
        DialogUtils.showError(context, "Réinitialisation", errorMessage, null);
      }
    }
  }

  static Future<void> verifyPasswordResetCode(BuildContext context, String oobCode) async {
    try {
      if (context.mounted) {
        DialogUtils.showLoading(context, "Chargement en cours...");
      }
      await FirebaseAuth.instance.verifyPasswordResetCode(oobCode);
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
      }
      String errorMessage;
      switch (e.code) {
        case 'expired-action-code':
          errorMessage = "Le lien de réinitialisation a expiré.";
          break;
        case 'invalid-action-code':
          errorMessage = "Le code de réinitialisation est invalide.";
          break;
        default:
          errorMessage = "Une erreur inattendue est survenue : ${e.code}.";
      }
      if (context.mounted) {
        DialogUtils.showError(context, "Réinitialisation", errorMessage, (){
          Navigator.of(context).pop();
        });
      }
    }
  }

  static Future<void> signOut(BuildContext context) async {
    if (context.mounted) {
      DialogUtils.showLoading(context, "Déconnexion en cours...");
    }
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }
}