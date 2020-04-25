import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:volcano/Provider/AuthBloc/signin_bloc.dart';
import 'package:volcano/Provider/AuthBloc/signup_bloc.dart';
import 'package:volcano/Provider/PostsBloc/posts_bloc.dart';
import 'package:volcano/Screens/Authentication/sign_in.dart';
import 'package:volcano/Screens/intro_page.dart';
import 'Themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInBloc()),
        ChangeNotifierProvider(create: (_) => SignUpBloc()),
        ChangeNotifierProxyProvider<SignInBloc, PostsBloc>(
          create: (_) => PostsBloc(),
          update: (_, signIn, posts) => posts..uid = signIn.userUID,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navGK,
        theme: themes,
        title: 'Volcano',
        home: await checkIntro() ? IntroPage() : SignIn(),
      ),
    ),
  );
}

/// Check if it's the user first time in the app.
Future<bool> checkIntro() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('intro') ?? true;
}
