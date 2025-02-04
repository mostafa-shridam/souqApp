part of 'account_cubit.dart';

sealed class AccountState {}

final class AccountInitial extends AccountState {}

final class SelectImageSuccess extends AccountState {}

final class SelectImageFailure extends AccountState {}

final class ChangeThemeSuccess extends AccountState {
  final ThemeMode themeMode;

  ChangeThemeSuccess({required this.themeMode});
}

final class ChangeThemeLoading extends AccountState {}

final class ChangeLanguageSuccess extends AccountState {
  final bool newLanguage;
  ChangeLanguageSuccess({required this.newLanguage});
}

final class ChangeNotigicationSuccess extends AccountState {
  final bool changeNotification;

  ChangeNotigicationSuccess({required this.changeNotification});
}

final class SignOutSuccess extends AccountState {}

final class GetNewImageSuccess extends AccountState {
  final String imagePath;
  GetNewImageSuccess({required this.imagePath});
}
