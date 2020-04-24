import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/AuthBloc/signin_bloc.dart';

class SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SignInBloc>(
      builder: (_, _bloc, __) => Container(
        width: 140,
        height: 100,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: FlatButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () => _bloc.signIn(context),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: GradientText(
                  "Sign in!",
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurple,
                      Colors.purple[100],
                      Colors.amber[100]
                    ],
                  ),
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(width: 10),
              FaIcon(FontAwesomeIcons.arrowCircleRight)
            ],
          ),
        ),
      ),
    );
  }
}
