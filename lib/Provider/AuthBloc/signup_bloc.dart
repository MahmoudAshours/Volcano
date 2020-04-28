import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:volcano/Provider/AuthBloc/validators.dart';
import 'package:volcano/Screens/home_page.dart';
import 'package:volcano/Services/auth_service.dart';

class SignUpBloc with ChangeNotifier {
  String email;
  String password;
  String confirmPassword;
  bool validateEmail = true;
  bool validatePassword = true;
  bool validateConfirmPassword = true;
  final _authService = AuthService();
  final _validator = Validators();
  var _userUID;

  get userUID => _userUID;

  void signUp(BuildContext context) {
    if (!_validator.validateEmailMessage(email)) {
      validateEmail = false;
      notifyListeners();
    } else if (!_validator.validatePasswordMessage(password)) {
      validatePassword = false;
      notifyListeners();
    } else if (password != confirmPassword) {
      validateConfirmPassword = false;
      notifyListeners();
    } else {
      validateEmail = true;
      validatePassword = true;
      validateConfirmPassword = true;
      notifyListeners();
      _authService.signUp('$email', '$password', context).then(
        (String uid) {
          if (uid != null) {
            _userUID = uid;
            notifyListeners();
            routePush(HomePage(), RouterType.fade);
          }
        },
      );
    }
  }
}
