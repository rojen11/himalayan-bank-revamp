import 'package:app/core/presentation/screens/splash_screen.dart';
import 'package:app/core/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Himalayan Bank',
        theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'SFProDisplay',
            primaryColor: primaryColor),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}
