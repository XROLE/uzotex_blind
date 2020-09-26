class Validator {
  static validateEmailField(String email) {
    final checkMail = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (email.trim().isEmpty) {
      return 'Please provide an email';
    } else if (!checkMail.hasMatch(email)) {
      return 'Email is not valid';
    }
    return null;
  }

  static validateField(String fieldName) {
    return fieldName.trim().isEmpty
        ? 'Can not be Empty'
        : null;
  }
  static validatePasswordField(String password) {
    return password.trim().length < 6
        ? 'Password must be at least 6 characters'
        : null;
  }

  static validateConfirmPasswordField(String password, String confirmPassword) {
    return password.trim() != confirmPassword.trim() ? 'Password do not match' : null;
  }
}
