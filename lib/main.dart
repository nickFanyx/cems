import 'package:cems/home.dart';
import 'package:cems/home_admin.dart';
import 'package:cems/theme.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}
// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: AnimatedSplashScreen(
        nextScreen: const Home(),
        splash: 'assets/images/cemsicon.png',
        splashIconSize: 200,
        splashTransition: SplashTransition.slideTransition,
        backgroundColor: Colors.white,
        pageTransitionType: PageTransitionType.fade,
        duration: 2000,
      ),
    );
  }
}
