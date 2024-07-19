
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:souq/features/auth/data/domain/entites/user_intity.dart';
import 'package:souq/features/auth/data/domain/repo/auth_repo.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
    static SignInCubit get(context) => BlocProvider.of(context);
  final AuthRepo authRepo;
  Future<void> signInWithEmailAndPassword(String email, String password)async {
    emit(SignInLoading());
    var result = await authRepo.signInWithEmailAndPassword(
      email,
      password,
    );
    result.fold(
      (failure) => emit(SignInFailure(message: failure.message),),
      (userEntity) => emit(SignInSuccess(userEntity: userEntity),),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(SignInFailure(message: failure.message),),
      (userEntity) => emit(SignInSuccess(userEntity: userEntity),),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SignInLoading());
    var result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(SignInFailure(message: failure.message),),
      (userEntity) => emit(SignInSuccess(userEntity: userEntity),),
    );
  }
}
