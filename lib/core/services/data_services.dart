import 'package:souq/features/auth/data/domain/entites/user_intity.dart';

abstract class DatabaseService {

 Future<void> addData(
      {required String path, required Map<String, dynamic> data});
  Future<UserEntity> getUserData({required String path , required String uid});
}
