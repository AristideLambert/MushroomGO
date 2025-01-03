import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mushroom_go/constant/setting_constant.dart';
import 'package:mushroom_go/models/person.dart';
import 'package:mushroom_go/utils/dialog/dialog_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirebaseAuthUtils{
  FirebaseAuthUtils._();

  static Future<void> createAccount(BuildContext context, String firstname, String name, String email, String password, Function()? next) async {
    try {
      if(context.mounted){
        DialogUtils.showLoading(context, AppLocalizations.of(context)!.firebaseAuthUtilsCreateAccountInProgressTitle);
      }
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(context.mounted){
        User user = _getUser(context);
        await user.updateDisplayName("$firstname $name");
        await user.updatePhotoURL(SettingConstant.pathDefaultImageProfile);
        await FirebaseFirestore.instance
            .collection("user")
            .doc(user.uid)
            .set({
          "firstname": firstname,
          "name": name,
        });
      }
      if (context.mounted) {
        Navigator.of(context).pop();
        next?.call();
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        String errorMessage;
        switch (e.code) {
          case 'email-already-in-use':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorCreateAccountEmailAlreadyUse;
            break;
          case 'invalid-email':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorCreateAccountInvalidEmail;
            break;
          case 'weak-password':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorCreateAccountWeakPassword;
            break;
          case 'operation-not-allowed':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorCreateAccountOperationNotAllowed;
            break;
          case 'too-many-requests':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorCreateAccountTooManyRequests;
            break;
          case 'user-token-expired':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorCreateAccountUserTokenExpired;
            break;
          case 'network-request-failed':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorCreateAccountNetworkRequestFailed;
            break;
          default:
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorDefault;
        }
        DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.firebaseAuthUtilsCreateAccountTitle, errorMessage, "OK", null, false);
      }
    } on Exception catch(e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.firebaseAuthUtilsCreateAccountTitle, e.toString().contains('Exception:') ? e.toString().split('Exception:').last.trim() : e.toString(), AppLocalizations.of(context)!.popupOK, null, false);
      }
    }
  }

  static Future<void> signInAccount(BuildContext context, String email, String password, Function()? next) async {
    try {
      if (context.mounted) {
        DialogUtils.showLoading(context, AppLocalizations.of(context)!.firebaseAuthUtilsSignInAccountInProgressTitle);
      }
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if (context.mounted) {
        Navigator.of(context).pop();
        next?.call();
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        String errorMessage;
        switch (e.code) {
          case 'invalid-email':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorSignInAccountInvalidEmail;
            break;
          case 'user-disabled':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorSignInAccountUserDisabled;
            break;
          case 'user-not-found':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorSignInAccountUserNotFound;
            break;
          case 'wrong-password':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorSignInAccountWrongPassword;
            break;
          case 'too-many-requests':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorSignInAccountTooManyRequests;
            break;
          case 'user-token-expired':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorSignInAccountUserTokenExpired;
            break;
          case 'network-request-failed':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorSignInAccountNetworkRequestFailed;
            break;
          case 'INVALID_LOGIN_CREDENTIALS':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorSignInAccountInvalidCredential;
            break;
          case 'invalid-credential':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorSignInAccountInvalidCredential;
            break;
          case 'operation-not-allowed':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorSignInAccountOperationNotAllowed;
            break;
          default:
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorDefault;
        }
        DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.firebaseAuthUtilsSignInAccountTitle, errorMessage, AppLocalizations.of(context)!.popupOK, null, false);
      }
    }
  }

  static Future<void> updatePasswordAccount(BuildContext context, String oldPassword, String newPassword) async {
    try {
      User user = _getUser(context);
      await signInAccount(context, user.email!, oldPassword, null);
      if (context.mounted) {
        DialogUtils.showLoading(context, AppLocalizations.of(context)!.firebaseAuthUtilsUpdatePasswordAccountInProgressTitle);
        user = _getUser(context);
      }
      await user.updatePassword(newPassword);
      if (context.mounted) {
        Navigator.of(context).pop();
        DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.firebaseAuthUtilsUpdatePasswordAccountTitle, AppLocalizations.of(context)!.firebaseAuthUtilsUpdatePasswordAccountDescription, AppLocalizations.of(context)!.popupOK, (){
          Navigator.of(context).pop();
        }, false);
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        String errorMessage;
        switch (e.code) {
          case 'weak-password':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorUpdatePasswordAccountWeakPassword;
            break;
          case 'requires-recent-login':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorUpdatePasswordAccountRequiresRecentLogin;
            break;
          default:
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorDefault;
        }
        DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.firebaseAuthUtilsUpdatePasswordAccountTitle, errorMessage, AppLocalizations.of(context)!.popupOK, null, false);
      }
    } on Exception catch(e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.firebaseAuthUtilsUpdatePasswordAccountTitle, e.toString().contains('Exception:') ? e.toString().split('Exception:').last.trim() : e.toString(), AppLocalizations.of(context)!.popupOK, null, false);
      }
    }
  }

  static Future<void> sendPasswordResetEmailAccount(BuildContext context, String email) async {
    try {
      if (context.mounted) {
        DialogUtils.showLoading(context, AppLocalizations.of(context)!.firebaseAuthUtilsSendPasswordResetEmailAccountInProgressTitle);
      }
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      if (context.mounted) {
        Navigator.of(context).pop();
        DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.firebaseAuthUtilsSendPasswordResetEmailAccountTitle, AppLocalizations.of(context)!.firebaseAuthUtilsSendPasswordResetEmailAccountDescription, AppLocalizations.of(context)!.popupOK, (){
          Navigator.of(context).pop();
        }, false);
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        String errorMessage;
        switch (e.code) {
          case 'auth/invalid-email':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorSendPasswordResetEmailAccountAuthInvalidEmail;
            break;
          case 'auth/missing-android-pkg-name':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorSendPasswordResetEmailAccountAuthMissingAndroidPkgName;
            break;
          case 'auth/missing-continue-uri':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorSendPasswordResetEmailAccountAuthMissingContinueUri;
            break;
          case 'auth/missing-ios-bundle-id':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorSendPasswordResetEmailAccountAuthMissingIosBundleId;
            break;
          case 'auth/invalid-continue-uri':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorSendPasswordResetEmailAccountAuthInvalidContinueUri;
            break;
          case 'auth/unauthorized-continue-uri':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorSendPasswordResetEmailAccountAuthUnauthorizedContinueUri;
            break;
          case 'auth/user-not-found':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorSendPasswordResetEmailAccountAuthUserNotFound;
            break;
          default:
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorDefault;
        }
        DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.firebaseAuthUtilsSendPasswordResetEmailAccountTitle, errorMessage, AppLocalizations.of(context)!.popupOK, null, false);
      }
    }
  }

  static Future<void> verifyPasswordResetCodeAccount(BuildContext context, String oobCode) async {
    try {
      if (context.mounted) {
        DialogUtils.showLoading(context, AppLocalizations.of(context)!.firebaseAuthUtilsVerifyPasswordResetCodeAccountInProgressTitle);
      }
      await FirebaseAuth.instance.verifyPasswordResetCode(oobCode);
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        String errorMessage;
        switch (e.code) {
          case 'expired-action-code':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorVerifyPasswordResetCodeAccountExpiredActionCode;
            break;
          case 'invalid-action-code':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorVerifyPasswordResetCodeAccountInvalidActionCode;
            break;
          case 'user-disabled':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorVerifyPasswordResetCodeAccountUserDisabled;
            break;
          case 'user-not-found':
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorVerifyPasswordResetCodeAccountUserNotFound;
            break;
          default:
            errorMessage = AppLocalizations.of(context)!.firebaseAuthUtilsErrorDefault;
        }
        DialogUtils.showPopupInformation(context, AppLocalizations.of(context)!.firebaseAuthUtilsVerifyPasswordResetCodeAccountTitle, errorMessage, AppLocalizations.of(context)!.popupOK, (){
          Navigator.of(context).pop();
        }, false);
      }
    }
  }

  static Future<void> confirmPasswordResetAccount(BuildContext context, String oobCode, String newPassword) async {
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

  static Future<void> signOutAccount(BuildContext context) async {
    if (context.mounted) {
      DialogUtils.showLoading(context, "Déconnexion en cours...");
    }
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  static Future<Person?> getFullName(BuildContext context) async {
    try {
      if (context.mounted) {
        DialogUtils.showLoading(context, "Chargement en cours...");
      }
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        throw Exception("Aucun utilisateur connecté");
      }
      final docSnapshot = await FirebaseFirestore.instance
          .collection("user")
          .doc(uid)
          .get();
      if (!docSnapshot.exists) {
        throw Exception("Informations non trouvées pour cet utilisateur");
      }
      final firstname = docSnapshot.data()?['firstname'];
      if (firstname == null) {
        throw Exception("Prénom non trouvé");
      }
      final name = docSnapshot.data()?['name'];
      if (name == null) {
        throw Exception("Nom non trouvé");
      }
      if (context.mounted) {
        Navigator.of(context).pop();
      }
      return Person(firstname: firstname, name: name);
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
      }
      if (context.mounted) {
        DialogUtils.showError(context, "Réinitialisation", e.toString(), null);
      }
      return null;
    }
  }

  static Future<Person?> updateFullName(BuildContext context, String firstname, String name) async {
    try {
      if (context.mounted) {
        DialogUtils.showLoading(context, "Chargement en cours...");
      }
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        throw Exception("Aucun utilisateur connecté");
      }
      await FirebaseFirestore.instance.collection("user").doc(uid).update({
        "firstname": firstname,
        "name": name,
      });
      FirebaseAuth.instance.currentUser?.updateDisplayName("$firstname $name");
      if (context.mounted) {
        Navigator.of(context).pop();
      }
      return Person(firstname: firstname, name: name);
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
      }
      if (context.mounted) {
        DialogUtils.showError(context, "Réinitialisation", e.toString(), null);
      }
      return null;
    }
  }

  static Future<void> deleteAccount(BuildContext context, String password) async {
    try {
      User user = _getUser(context);
      await signInAccount(context, user.email!, password, null);
      if(context.mounted){
        DialogUtils.showLoading(context, "Inscription en cours...");
      }
      user = _getUser(context);
      await FirebaseFirestore.instance.collection("user").doc(user.uid).delete();
      await user.delete();
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
        DialogUtils.showPopupInformation(context, "Inscription", errorMessage, "OK", null, false);
      }
    }
  }

  static User _getUser(BuildContext context){
    User? user = FirebaseAuth.instance.currentUser;
    if(user == null){
      throw Exception(AppLocalizations.of(context)!.firebaseAuthUtilsErrorUser);
    }
    return user;
  }
}