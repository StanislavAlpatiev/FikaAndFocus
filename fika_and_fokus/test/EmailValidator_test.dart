import 'package:fika_and_fokus/LogIn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('EmptyEmailReturnsErrorMessage', () async {
    final result = EmailFieldValidator.validate('');
    expect(result, 'Email can\'t be empty');
  });
}
