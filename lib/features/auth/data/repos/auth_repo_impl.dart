import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/core/errors/exception.dart';
import 'package:souq/core/errors/filures.dart';
import 'package:souq/core/services/data_services.dart';
import 'package:souq/core/services/firebase_auth_service.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utils/backend_endpoint.dart';
import 'package:souq/core/utils/constants/constants.dart';
import 'package:souq/features/auth/data/domain/entites/user_intity.dart';
import 'package:souq/features/auth/data/domain/repo/auth_repo.dart';
import 'package:souq/features/auth/data/models/user_model.dart';
import 'package:souq/generated/l10n.dart';

class AuthRepoIml extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoIml(
      {required this.databaseService, required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
        image: user.photoURL ??
            "https://w7.pngwing.com/pngs/27/394/png-transparent-computer-icons-user-user-heroes-black-avatar-thumbnail.png",
        phone: user.phoneNumber ?? 'Please add your phone number',
      );
      await addUserData(user: userEntity);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(
        ServerFailure(
          message: e.message,
        ),
      );
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );

      return left(
        ServerFailure(
          message: S.current.AnErroeOccured,
        ),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await user.delete();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      var userEntity = await getUserData(uid: user.uid);
      await addUserData(user: userEntity);
      await saveUserData(user: userEntity);

      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);

      return left(
        ServerFailure(
          message: e.message,
        ),
      );
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}',
      );

      return left(
        ServerFailure(
          message: S.current.AnErroeOccured,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();

      var userEntity = UserModel.fromFirebaseUser(user);

      var isUserExist = await databaseService.checkIfDataExists(
          path: BackendEndpoint.isUserExists, docuementId: user.uid);
      if (isUserExist) {
        await getUserData(uid: user.uid);
        await saveUserData(user: userEntity);
      } else {
        await addUserData(user: userEntity);
        await saveUserData(user: userEntity);
      }

      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(
        ServerFailure(
          message: e.message,
        ),
      );
    } catch (e) {
      await deleteUser(user);

      log(
        'Exception in AuthRepoImpl.aignInWithGoogle: ${e.toString()}',
      );

      return left(
        ServerFailure(
          message: S.current.AnErroeOccured,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();

      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseService.checkIfDataExists(
          path: BackendEndpoint.isUserExists, docuementId: user.uid);
      if (isUserExist) {
        await getUserData(uid: user.uid);
        await saveUserData(user: userEntity);
      } else {
        await addUserData(user: userEntity);
        await saveUserData(user: userEntity);
      }
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);

      return left(
        ServerFailure(
          message: e.message,
        ),
      );
    } catch (e) {
      await deleteUser(user);

      log(
        'Exception in AuthRepoImpl.aignInWithFacebook: ${e.toString()}',
      );

      return left(
        ServerFailure(
          message: S.current.AnErroeOccured,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithApple();

      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseService.checkIfDataExists(
          path: BackendEndpoint.isUserExists, docuementId: user.uid);
      if (isUserExist) {
        await getUserData(uid: user.uid);
        await saveUserData(user: userEntity);
      } else {
        await addUserData(user: userEntity);
        await saveUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          message: S.current.AnErroeOccured,
        ),
      );
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuthService.signOut();
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      documentId: user.uId,
      path: BackendEndpoint.addUserData,
      data: user.toMap(),
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseService.getData(
        path: BackendEndpoint.getUserData, documentId: uid);
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kUserData, jsonData);
  }
}
