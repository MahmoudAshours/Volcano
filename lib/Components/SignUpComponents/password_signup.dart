import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/AuthBloc/signup_bloc.dart';
import 'package:volcano/Utils/animated_textfeild.dart';

class PasswordSignUp extends StatefulWidget {
  @override
  _PasswordComponentState createState() => _PasswordComponentState();
}

class _PasswordComponentState extends State<PasswordSignUp> {
  bool _obsecurity = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpBloc>(
      builder: (_, _bloc, __) => Container(
        child: AnimatedTextFeild(
          textField: TextField(
            obscureText: _obsecurity,
            onChanged: (password) => _bloc.password = password,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 8.0),
              border: InputBorder.none,
              hintText: 'Password',
              errorMaxLines: 4,
              errorText: _bloc.validatePassword
                  ? null
                  : "Your Password should be at least 8 characters , contains uppercase and symbol",
              icon: IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: () => setState(() =>
                      _obsecurity ? _obsecurity = false : _obsecurity = true)),
              hintStyle: TextStyle(color: Colors.amber[100]),
            ),
            style: TextStyle(color: Colors.amber[100]),
          ),
          borderColor: Colors.amber[100],
          icon: Center(
            child: FaIcon(
              FontAwesomeIcons.lock,
              color: Colors.amber[100],
            ),
          ),
        ),
      ),
    );
  }
}
