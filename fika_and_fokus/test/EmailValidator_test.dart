import 'dart:math';

import 'package:fika_and_fokus/LogIn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Empty Email Returns Error Message', () async {
    final result = EmailFieldValidator.validate('');
    expect(result, 'Email can\'t be empty');
  });

  test('Empty Password Returns Error Message', () async {
    final result = PasswordFieldValidator.validate('');
    expect(result, 'Password can\'t be empty');
  });

  test('Not Empty Password Returns empty string', () async {
    final result = PasswordFieldValidator.validate("123");
    expect(result, '');
  });

  test('Not Empty Email Returns empty string', () async {
    final result = EmailFieldValidator.validate("test@gmail.com");
    expect(result, '');
  });
}
