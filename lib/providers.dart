import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/AuthBloc/signin_bloc.dart';

class Providers extends StatelessWidget {
  final MaterialApp child;
  Providers({this.child});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInBloc()),
      ],
      child: child,
    );
  }
}
