class Validators {
  final _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final _passwordRegex = RegExp(
      "^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})");
  bool validateEmailMessage(String email) {
    if (_emailRegExp.hasMatch(email)) {
      return true;
    }
    return false;
  }

  bool validatePasswordMessage(String password) {
    if (_passwordRegex.hasMatch(password)) {
      return true;
    }
    return false;
  }
}
