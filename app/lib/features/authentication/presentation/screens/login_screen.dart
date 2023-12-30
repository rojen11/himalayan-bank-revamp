import 'package:app/features/authentication/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.asset("assets/images/logo_small.png",
                    width: MediaQuery.of(context).size.width * 0.2),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Log in",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
                ),
                const SizedBox(
                  height: 40,
                ),
                LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
