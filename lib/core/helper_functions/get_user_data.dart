import 'dart:convert';

import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utlis/constants/constants.dart';
import 'package:souq/features/auth/data/domain/entites/user_intity.dart';
import 'package:souq/features/auth/data/models/user_model.dart';

UserEntity getUserData() {
  var jsonString = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(
    jsonDecode(jsonString),
  );

  return userEntity;
}