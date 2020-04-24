import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/AuthBloc/signup_bloc.dart';
import 'package:volcano/Utils/animated_textfeild.dart';

class EmailSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpBloc>(
      builder: (_, _bloc, __) => Container(
        child: AnimatedTextFeild(
          textField: TextField(
            onChanged: (email) => _bloc.email = email,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 8.0),
              border: InputBorder.none,
              hintText: 'Email',
              errorText: _bloc.validateEmail ? null : "Your e-mail isn't valid",
              hintStyle: TextStyle(color: Colors.purple[100]),
            ),
            style: TextStyle(color: Colors.purple[100]),
          ),
          borderColor: Colors.purple[100],
          icon: Center(
            child: FaIcon(
              FontAwesomeIcons.envelope,
              color: Colors.purple[100],
            ),
          ),
        ),
      ),
    );
  }
}
