import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/ActivitiesBloc/activity_bloc.dart';
import 'package:volcano/Provider/ArticlesBloc/articles_bloc.dart';
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
        ChangeNotifierProvider(create: (_) => ArticleBloc()),
        ChangeNotifierProxyProvider2<SignUpBloc, SignInBloc, PostsBloc>(
          create: (_) => PostsBloc(),
          update: (_, signUp, signIn, posts) {
            if (signIn.getUserUID == null) {
              return posts..uid = signUp.userUID;
            } else if (signUp.userUID == null) {
              return posts..uid = signIn.getUserUID;
            } else {
              return posts..uid = signIn.getUserUID;
            }
          },
        ),
        ChangeNotifierProxyProvider2<SignUpBloc, SignInBloc, ActivityBloc>(
          create: (_) => ActivityBloc(),
          update: (_, signUp, signIn, activity) {
            if (signIn.getUserUID == null) {
              return activity..userUID = signUp.userUID;
            } else if (signUp.userUID == null) {
              return activity..userUID = signIn.getUserUID;
            } else {
              return activity..userUID = signIn.getUserUID;
            }
          },
        ),
      ],
      child: child,
    );
  }
}
