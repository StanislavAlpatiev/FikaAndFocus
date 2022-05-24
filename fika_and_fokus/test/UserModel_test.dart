import 'package:fika_and_fokus/UserModel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('LoginUserWithEmptyString', () async {
    final user = UserModel(userName: "", email: "", password: "");
    user.email = "test@gmail.com";
    expect(user.getEmail, "test@gmail.com");
  });
}
