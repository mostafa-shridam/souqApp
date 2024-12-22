import 'dart:convert';

import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utils/constants/constants.dart';
import 'package:souq/features/auth/data/domain/entites/user_intity.dart';
import 'package:souq/features/auth/data/models/user_model.dart';

UserEntity getUserData() {
  var jsonString = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(
    jsonDecode(jsonString),
  );

  return userEntity;
}

UserEntity saveUserData({required UserEntity user}) {
  var jsonString = jsonEncode(user.toMap());
  Prefs.setString(kUserData, jsonString);

  return user;
}
