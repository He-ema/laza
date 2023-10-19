import 'package:laza/constants.dart';

class UserModel {
  final String name;
  final String image;

  UserModel({required this.name, required this.image});

  factory UserModel.fromJson(jsonData) {
    return UserModel(
      name: jsonData[kName],
      image: jsonData[kImage],
    );
  }
}
