import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:volcano/Screens/intro_page.dart';
import 'package:volcano/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    await checkIntro() ? IntroPage() : MyApp(),
  );
}
/// Check if it's the user first time in the app.
Future<bool> checkIntro() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('intro') ?? true;
}
