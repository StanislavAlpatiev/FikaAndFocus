import 'dart:convert';

UserModel userModelJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJSON(UserModel data) => json.encode(data.toJson());

class UserModel {
  String email = "";
  String userName = "";
  String password = "";

  UserModel(
    {
      required this.userName,
      required this.email,
      required this.password,
    }
  );

  UserModel.login(String username, String pass) {
    username = username;
    password = pass;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      email: json["email"],
      userName: json["username"],
      password: json["pass"]);

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": userName,
        "pass": password
      };

  String get getEmail => email;
  String get getUserName => userName;
  String get getPassword => password;
}
