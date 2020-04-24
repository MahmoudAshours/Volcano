import 'package:flutter/material.dart';
import 'package:volcano/Services/auth_service.dart';

class SignInBloc with ChangeNotifier {
  final _authService = AuthService();
  var userUID;
  var _authStatus = AuthStatus.NOT_DETERMINED;

  String email;
  String password;

  AuthStatus get authStatus => _authStatus;
  void signIn(BuildContext context) {
    _authService.signIn('$email', '$password', context).then(
      (String uid) {
        userUID = uid;
        _authStatus = AuthStatus.LOGGED_IN;
        notifyListeners();
      },
    );
  }
}

void validateEmailPassword() {}
enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}
