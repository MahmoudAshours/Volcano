import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:volcano/Screens/home_page.dart';
import 'package:volcano/Services/auth_service.dart';

class SignInBloc with ChangeNotifier {
  String email;
  String password;
  final _authService = AuthService();
  var _authStatus = AuthStatus.NOT_DETERMINED;
  var _userUID;

  AuthStatus get authStatus => _authStatus;
  get userUID => _userUID;

  void signIn(BuildContext context) {
    _authService.signIn('$email', '$password', context).then(
      (String uid) {
        _userUID = uid;
        _authStatus = AuthStatus.LOGGED_IN;
        routePush(HomePage(), RouterType.fade);
        notifyListeners();
      },
    );
  }
}

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}
