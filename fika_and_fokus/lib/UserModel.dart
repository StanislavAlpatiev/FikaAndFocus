import 'dart:convert';

import 'package:fika_and_fokus/User.dart';

UserModel userModelJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJSON(UserModel data) => json.encode(data.toJson());

class UserModel {
  int id;
  String userName;
  String email;
  String password;
  String confirmedPass;

  UserModel(
      {required this.id,
      required this.userName,
      required this.email,
      required this.password,
      required this.confirmedPass});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      userName: json["username"],
      email: json["email"],
      password: json["pass"],
      confirmedPass: json["confirmPass"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": userName,
        "email": email,
        "pass": password,
        "confirmedPass": confirmedPass
      };

  String get getUserName => userName;
  String get getEmail => email;
  String get getPassword => password;
}
