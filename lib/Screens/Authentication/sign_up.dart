import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Components/SignUpComponents/confirmpass_component.dart';
import 'package:volcano/Components/SignUpComponents/email_signup.dart';
import 'package:volcano/Components/SignUpComponents/password_signup.dart';
import 'package:volcano/Components/SignUpComponents/signupbutton_component.dart';
import 'package:volcano/Components/SignUpComponents/welcome_text.dart';
import 'package:volcano/Provider/AuthBloc/signup_bloc.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Consumer<SignUpBloc>(
          builder: (_, _bloc, __) => Column(
            children: <Widget>[
              JourneyText(),
              SizedBox(height: 60),
              EmailSignUp(),
              SizedBox(height: 30),
              PasswordSignUp(),
              SizedBox(height: 30),
              ConfirmPassword(),
              SizedBox(height: 30),
              SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}
