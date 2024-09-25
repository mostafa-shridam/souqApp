import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utlis/constants/constants.dart';
import 'package:souq/features/auth/data/domain/repo/auth_repo.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());
  static AccountCubit get(context) => BlocProvider.of(context);

  AuthRepo? authRepo;

  var picker = ImagePicker();
  File? pickedFile;
  void getNewImage(ImageSource fileSource) async {
    final pickedFile = await picker.pickImage(source: fileSource);

    if (pickedFile != null) {
  log(pickedFile.path);
      emit(
        GetNewImageSuccess(
          imagePath: pickedFile.path,
        ),
      );
    }
  }

  Future<File?> xFileToFile(XFile xFile) async {
    final directory = await xFile;
    final file = File('${directory.path}/${xFile.name}');
    return file;
  }

  void changeThemeMode(bool isDark) {
    Prefs.setBool(kIsDarkMode, isDark);
    emit(
      ChangeThemeSuccess(
        themeMode: isDark,
      ),
    );
  }

  void changeLanguage(bool newLanguage) {
    Prefs.setBool(kNewLanguage, newLanguage);

    emit(
      ChangeLanguageSuccess(
        newLanguage: newLanguage,
      ),
    );
  }

  bool currentValue = false;

  void changeNotification(bool changeNotfication) {
    Prefs.setBool(kChangeNotification, changeNotfication);
    currentValue = changeNotfication;
    emit(
      ChangeNotigicationSuccess(changeNotification: changeNotfication),
    );
  }

  Future<void> signOut() async {
    await authRepo?.signOut();
    Prefs.setBool(kIsLogin, false);
    emit(
      SignOutSuccess(),
    );
  }

  Future<void> deleteUser() async {
    var user = FirebaseAuth.instance.currentUser;
    await authRepo?.deleteUser(user);

    await Prefs.clear();
    emit(
      SignOutSuccess(),
    );
  }
}
