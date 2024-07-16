import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:souq/core/errors/exceptions.dart';
import 'package:souq/core/errors/filures.dart';
import 'package:souq/core/services/firebase_auth_service.dart';
import 'package:souq/features/auth/data/domain/entites/user_intity.dart';
import 'package:souq/features/auth/data/domain/repo/auth_repo.dart';
import 'package:souq/features/auth/data/models/user_model.dart';
import 'package:souq/generated/l10n.dart';

class AuthRepoIml extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoIml({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);

      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(
        ServerFailure(
          message: e.message,
        ),
      );
    } catch (e) {
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
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);

      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(
        ServerFailure(
          message: e.message,
        ),
      );
    } catch (e) {
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
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(
        ServerFailure(
          message: e.message,
        ),
      );
    } catch (e) {
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
  Future<Either<Failure, UserEntity>> signInWithFacebook() async{
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(
        ServerFailure(
          message: e.message,
        ),
      );
    } catch (e) {
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
}
