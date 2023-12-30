import 'package:app/core/utils/constants.dart';
import 'package:app/features/authentication/presentation/providers/auth_provider.dart';
import 'package:app/features/home/presentation/screens/screen_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  void handleSubmit(BuildContext context) {
    Provider.of<AuthProvider>(context, listen: false)
        .login(phoneController.value.text, passwordController.value.text)
        .then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login Successful")));

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ScreenWrapper()));
    }).catchError((e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.number,
          controller: phoneController,
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
          controller: passwordController,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: primaryColor,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                }),
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
          obscureText: !_isPasswordVisible,
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
            onPressed: () => handleSubmit(context),
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
