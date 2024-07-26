import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:souq/core/services/data_services.dart';
import 'package:souq/features/auth/data/domain/entites/user_intity.dart';
import 'package:souq/features/auth/data/models/user_model.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path, required Map<String, dynamic> data}) async {
    await firestore.collection(path).add(data);
  }

  @override
  Future<UserEntity> getUserData(
      {required String path, required String uid}) async {
    var data = await firestore.collection(path).doc(uid).get();
    return UserModel.fromJson(data.data() as Map<String, dynamic>);
  }
}
