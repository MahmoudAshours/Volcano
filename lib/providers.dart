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
        Provider(create: (_) => PostsBloc()),
        ChangeNotifierProxyProvider<SignInBloc, PostsBloc>(
          create: (_) => PostsBloc(),
          update: (_, signIn, posts) => posts..uid = signIn.userUID,
        ),
      ],
      child: child,
    );
  }
}
