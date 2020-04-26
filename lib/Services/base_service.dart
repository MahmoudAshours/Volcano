import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class BaseAuth {
  Future<String> signIn(String email, String password, BuildContext context);

  Future<String> signUp(String email, String password, BuildContext context);

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();

  Stream checkIfLoggedIn();
}
