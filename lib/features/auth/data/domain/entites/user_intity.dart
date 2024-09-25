class UserEntity {
  final String name;
  final String email;
  final String uId;
  final String image;
  final String phone;

  UserEntity({required this.name, required this.email, required this.uId,required this.image, required this.phone, });
  toMap(){
    return {
      'name' : name,
      'email' : email,
      'uId' : uId,
      'image' : image,
      'phone' : phone
    };
  }
}
