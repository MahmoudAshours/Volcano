import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/AuthBloc/signup_bloc.dart';
import 'package:volcano/Utils/animated_textfeild.dart';

class ConfirmPassword extends StatefulWidget {
  @override
  _ConfirmPasswordComponentState createState() =>
      _ConfirmPasswordComponentState();
}

class _ConfirmPasswordComponentState extends State<ConfirmPassword> {
  bool _obsecurity = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpBloc>(
      builder: (_, _bloc, __) => Container(
        child: AnimatedTextFeild(
          textField: TextField(
            obscureText: _obsecurity,
            onChanged: (String confirmPassword) =>
                _bloc.confirmPassword = confirmPassword,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 8.0),
              border: InputBorder.none,
              hintText: 'Confirm Password',
              errorText: _bloc.validateConfirmPassword
                  ? null
                  : "Your passwords aren't identical",
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
              FontAwesomeIcons.userLock,
              color: Colors.amber[100],
            ),
          ),
        ),
      ),
    );
  }
}
