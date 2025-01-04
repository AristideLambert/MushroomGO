class PasswordUtils{
  PasswordUtils._();

  static bool checkLength(String password) {
    return password.length >= 12;
  }

  static bool checkUpperCase(String password) {
    return RegExp(r'[A-Z]').hasMatch(password);
  }

  static bool checkLowerCase(String password) {
    return RegExp(r'[a-z]').hasMatch(password);
  }

  static bool checkSpecialCharacter(String password) {
    return RegExp(r'[^\w\s]').hasMatch(password);
  }

  static bool checkValid(String password){
    return checkLength(password) && checkUpperCase(password) && checkLowerCase(password) && checkSpecialCharacter(password);
  }
}