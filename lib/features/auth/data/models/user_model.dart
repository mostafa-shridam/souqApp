import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/features/auth/data/domain/entites/user_intity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uId , required super.image, required super.phone, });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
      image: user.photoURL ?? "https://w7.pngwing.com/pngs/27/394/png-transparent-computer-icons-user-user-heroes-black-avatar-thumbnail.png"
,
      phone: user.phoneNumber ?? 'Please add your phone number',
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
      image: json['image'],
      phone: json['phone'],
    );
  }
    factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      name: user.name,
      email: user.email,
      uId: user.uId,
      image: user.image,
      phone: user.phone,
    );
  }

  toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'image': image,
      'phone': phone,
    };
  }
}