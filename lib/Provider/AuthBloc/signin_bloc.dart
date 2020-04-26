import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:volcano/Screens/home_page.dart';
import 'package:volcano/Services/auth_service.dart';

class SignInBloc with ChangeNotifier {
  String email;
  String password;
  final _authService = AuthService();
  var _userUID;

  set userUID(uid) {
    _userUID = uid; 
  }

  get userUID => _userUID;

  void signIn(BuildContext context) {
    _authService.signIn('$email', '$password', context).then(
      (String uid) {
        if (uid != null) {
          _userUID = uid;
          notifyListeners();
          routePush(HomePage(), RouterType.fade);
          notifyListeners();
        }
      },
    );
  }

  void signOut(BuildContext context) => _authService.signOut();

  Stream checkAuth() => _authService.checkIfLoggedIn();
}
