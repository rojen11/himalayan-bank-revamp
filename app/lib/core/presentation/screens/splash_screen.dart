import 'dart:async';

import 'package:app/core/utils/constants.dart';
import 'package:app/features/authentication/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const LoginScreen();
        },
      ));
    });

    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png"),
              const FractionallySizedBox(
                widthFactor: 0.5,
                child: Text(
                  "Your one-stop solution for all your banking needs.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              )
            ]),
      ),
    );
  }
}
