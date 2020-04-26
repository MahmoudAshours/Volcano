import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/ActivitiesBloc/activity_bloc.dart';
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
            if (signIn.userUID == null) {
              return posts..uid = signUp.userUID;
            } else if (signUp.userUID == null) {
              return posts..uid = signIn.userUID;
            } else {
              var x = s().then((value) => value);
              return posts..uid = x;
            }
          },
        ),
        ChangeNotifierProxyProvider2<SignUpBloc, SignInBloc, ActivityBloc>(
          create: (_) => ActivityBloc(),
          //TODO
          update: (_, signUp, signIn, activity) {
            if (signIn.userUID == null)
              return activity..userUID = signUp.userUID;
            if (signUp.userUID == null)
              return activity..userUID = signIn.userUID;
            return activity
              ..userUID = FirebaseAuth.instance.onAuthStateChanged.first
                  .then((value) => value.uid);
          },
        ),
      ],
      child: child,
    );
  }

  Future<String> s() async {
    print(s);
    return await FirebaseAuth.instance.onAuthStateChanged.first
        .then((value) => value.uid);

  }
}
