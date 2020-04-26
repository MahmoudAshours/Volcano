import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/AuthBloc/signin_bloc.dart';
import 'package:volcano/Provider/AuthBloc/signup_bloc.dart';
import 'package:volcano/Provider/PostsBloc/posts_bloc.dart';

class Providers extends StatelessWidget {
  final MaterialApp child;
  Providers({this.child});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInBloc()),
        ChangeNotifierProvider(create: (_) => SignUpBloc()),
        ChangeNotifierProxyProvider2<SignUpBloc, SignInBloc, PostsBloc>(
          create: (_) => PostsBloc(),
          update: (_, signUp, signIn, posts) {
            if (signIn.userUID == null) return posts..uid = signUp.userUID;
            if (signUp.userUID == null) return posts..uid = signIn.userUID;
            return null;
          },
        ),
      ],
      child: child,
    );
  }
}
