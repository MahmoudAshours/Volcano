import 'package:flutter/material.dart';
import 'package:volcano/Components/SignInComponents/email_component.dart';
import 'package:volcano/Components/SignInComponents/new_user.dart';
import 'package:volcano/Components/SignInComponents/password_component.dart';
import 'package:volcano/Components/SignInComponents/signinbutton_component.dart';
import 'package:flare_flutter/flare_actor.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 300,
              child: FlareActor(
                "assets/rive/smile.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "Smile Face",
              ),
            ),
            EmailComponent(),
            SizedBox(height: 40),
            PasswordComponent(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                  alignment: Alignment.bottomRight, child: SignInButton()),
            ),
            NewUser()
          ],
        ),
      ),
    );
  }
}
