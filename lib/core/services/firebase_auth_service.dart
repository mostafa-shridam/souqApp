import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:souq/core/errors/exception.dart';
import 'package:souq/generated/l10n.dart';

class FirebaseAuthService {

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
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
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    final LoginResult loginResult =
        await FacebookAuth.instance.login(nonce: nonce);
    OAuthCredential facebookAuthCredential;

    if (Platform.isIOS) {
      switch (loginResult.accessToken!.type) {
        case AccessTokenType.classic:
          final token = loginResult.accessToken as ClassicToken;
          facebookAuthCredential = FacebookAuthProvider.credential(
            token.authenticationToken!,
          );
          break;
        case AccessTokenType.limited:
          final token = loginResult.accessToken as LimitedToken;
          facebookAuthCredential = OAuthCredential(
            providerId: 'facebook.com',
            signInMethod: 'oauth',
            idToken: token.tokenString,
            rawNonce: rawNonce,
          );
          break;
      }
    } else {
      facebookAuthCredential = FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );
    }

    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
      AppleAuthProvider appleProvider = AppleAuthProvider();

// add required 'email' scope
appleProvider = appleProvider.addScope('email');

// add optional 'name' scope
appleProvider = appleProvider.addScope('name');

// show the Apple sign in UI
await FirebaseAuth.instance.signInWithProvider(appleProvider);
    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    return (await FirebaseAuth.instance.signInWithCredential(oauthCredential))
        .user!;
  }
}
