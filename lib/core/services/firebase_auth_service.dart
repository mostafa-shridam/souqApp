import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:souq/core/errors/exceptions.dart';
import 'package:souq/generated/l10n.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException : ${e.toString()} , e.code : ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomException(message: S.current.PasswordWeak);
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: S.current.AccountAlreadyExists);
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: S.current.CkeckInterNet);
      } else {
        throw CustomException(message: S.current.AnErroeOccured);
      }
    } catch (e) {
      log("CustomExceptionInFirebaseAuthException : ${e.toString()}");
      throw CustomException(message: S.current.AnErroeOccured);
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException SignIn: ${e.toString()} , e.code : ${e.code}");
      if (e.code == 'invalid-credential') {
        throw CustomException(
          message: S.current.UserNotFound,
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: S.current.UserNotFound);
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: S.current.CkeckInterNet);
      } else {
        throw CustomException(message: S.current.AnErroeOccured);
      }
    } catch (e) {
      log("CustomExceptionInFirebaseAuthException SignIn: ${e.toString()}");
      throw CustomException(message: S.current.AnErroeOccured);
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return (await FirebaseAuth.instance.signInWithCredential(credential))
          .user!;
    } on FirebaseAuthException catch (e) {
      log("CustomExceptionInFirebaseAuthException SignInWithFacebook: ${e.toString()}");

      if (e.code == 'network-request-failed') {
        throw CustomException(message: S.current.CkeckInterNet);
      } else {
        throw CustomException(message: S.current.AnErroeOccured);
      }
    } catch (e) {
      log("CustomExceptionInFirebaseAuthException SignInWithGoogle: ${e.toString()}");
      throw CustomException(message: S.current.AnErroeOccured);
    }
  }

  Future<User> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
      return (await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential))
          .user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw CustomException(message: S.current.CkeckInterNet);
      } else {
        throw CustomException(message: S.current.AnErroeOccured);
      }
    } catch (e) {
      log("CustomExceptionInFirebaseAuthException SignInWithFacebook: ${e.toString()}");
      throw CustomException(message: S.current.AnErroeOccured);
    }
  }
}
