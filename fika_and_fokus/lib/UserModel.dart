import 'dart:convert';

UserModel userModelJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJSON(UserModel data) => json.encode(data.toJson());

class UserModel {
  String _email = "";
  String _userName = "";
  String _password = "";
  UserModel({
    required userName,
    required email,
    required password,
  });

  UserModel.login(String username, String pass) {
    username = username;
    password = pass;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      email: json["email"], userName: json["username"], password: json["pass"]);

  Map<String, dynamic> toJson() =>
      {"email": _email, "username": _userName, "pass": _password};

  String get getEmail =>
      _email.trim(); // if user accidentally added space at the end
  String get getUserName => _userName.trim();
  String get getPassword => _password;

  set password(String value) {
    _password = value;
  }

  set userName(String value) {
    _userName = value;
  }

  set email(String value) {
    _email = value;
  }
}
