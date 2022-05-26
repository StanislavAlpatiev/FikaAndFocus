import 'package:fika_and_fokus/UserModel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Login User With Empty String', () async {
    final user = UserModel(userName: "", email: "", password: "");
    expect(user.getEmail, "");
  });

  test('Set email for user', () async {
    final user =
        UserModel(userName: "Bob", email: "bob@gmail.com", password: "123");
    user.userName = 'Bob';
    expect(user.getUserName, "Bob");
  });

  test('Login Constructor', () async {
    final user = UserModel.login("Bob", "123");
    expect(user.getUserName, "Bob");
  });
}
