import 'package:app/core/utils/constants.dart';
import 'package:app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Phone number",
            focusColor: primaryColor,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            labelStyle: TextStyle(color: primaryColor),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(
            suffixIcon: IconButton(
                icon: const Icon(
                  Icons.remove_red_eye_outlined,
                  color: primaryColor,
                ),
                onPressed: () {}),
            labelText: "Password",
            focusColor: primaryColor,
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            labelStyle: const TextStyle(color: primaryColor),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
          obscureText: true,
        ),
        const SizedBox(
          height: 75,
        ),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shadowColor: primaryColor,
              elevation: 2,
              padding: const EdgeInsets.only(
                  top: 16, bottom: 16, left: 64, right: 64),
              backgroundColor: primaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
            child: const Text(
              "Login",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              maximumSize: const Size.fromWidth(250),
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(14),
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: primaryColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Use Biometrics",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                Image.asset(
                  "assets/images/face_id.png",
                  width: 30,
                  height: 30,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
