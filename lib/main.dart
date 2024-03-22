import 'package:flutter/material.dart';
import 'package:tvital/components/gradient.dart';
import 'package:tvital/screens/chartPage.dart';
import 'package:tvital/screens/login_screen.dart';
import 'package:tvital/screens/rooms.dart';
import 'package:tvital/screens/smart_config.dart';
import 'package:tvital/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        home: GradientBackground(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.white]),
            child: Splash()));
  }
}
