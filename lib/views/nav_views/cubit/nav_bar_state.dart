part of 'nav_bar_cubit.dart';

sealed class NavBarState {}

final class HomeInitial extends NavBarState {}

final class HomeChangeIndexState extends NavBarState {}

final class GetUserDataSuccess extends NavBarState {
  final UserEntity userEntity;

  GetUserDataSuccess({required this.userEntity});
}
