import 'dart:math';

import 'package:test/test.dart';
import 'package:uzotex_blind/service/validator.dart';

void main() {
  group('Validator', () {
    test('Account for empty email fields', () {
      final String validate = Validator.validateEmailField('');

      expect(validate, 'Please provide an email');
    });
    test('Account for invalid email without @ character', () {
      final String validate = Validator.validateEmailField('john');

      expect(validate, 'Email is not valid');
    });
    test('Account for invalid email with @ character', () {
      final String validate = Validator.validateEmailField('john@');

      expect(validate, 'Email is not valid');
    });
    test('Account for invalide mail with @ and leading string', () {
      final String validate = Validator.validateEmailField('john@doe');

      expect(validate, 'Email is not valid');
    });
    test('Validate email', () {
      final String validate = Validator.validateEmailField('john@doe.com');

      expect(validate, null);
    });
    test('Account for empty field', () {
      final String validate = Validator.validateField('');

      expect(validate, 'Can not be Empty');
    });
    test('Validate field if not empty', () {
      final String validate = Validator.validateField('notEmpty');

      expect(validate, null);
    });

    test('Account for  password field for length of password', () {
      final String validate = Validator.validatePasswordField('sf');

      expect(validate, 'Password must be at least 6 characters');
    });
    test('Validate password field for length of password', () {
      final String validate =
          Validator.validatePasswordField('the grooving dog');

      expect(validate, null);
    });
    test('Account for password match', () {
      final String validate =
          Validator.validateConfirmPasswordField('I dont mactch', 'I match');

      expect(validate, 'Passwords do not match');
    });
    test('Validate password match', () {
      final String validate =
          Validator.validateConfirmPasswordField('I match', 'I match');

      expect(validate,  null);
    });
  });
}
