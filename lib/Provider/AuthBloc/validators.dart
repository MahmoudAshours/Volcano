class Validators {
  var _emailRegExp = RegExp(
      "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)* @[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})");
  bool validateEmailMessage(String email) {
    if (_emailRegExp.hasMatch(email)) {
      return true;
    }
    return false;
  }
}
