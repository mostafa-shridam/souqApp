part of 'main_cubit.dart';

sealed class MainState {}

final class MainInitial extends MainState {}

final class HomeChangeIndexState extends MainState {}

final class GetUserDataSuccess extends MainState {
  final UserEntity userEntity;

  GetUserDataSuccess({required this.userEntity});
}
