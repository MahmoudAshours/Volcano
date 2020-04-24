import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/AuthBloc/signup_bloc.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpBloc>(
      builder: (_, _bloc, __) => Container(
        width: 140,
        height: 100,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: FlatButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () => _bloc.signUp(context),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "Sign Up!",
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
