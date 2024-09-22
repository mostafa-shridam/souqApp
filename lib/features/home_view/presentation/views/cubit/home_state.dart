part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeChangeIndexState extends HomeState {}

final class GetUserDataSuccess extends HomeState {
  final UserEntity userEntity;

  GetUserDataSuccess({required this.userEntity});
}
