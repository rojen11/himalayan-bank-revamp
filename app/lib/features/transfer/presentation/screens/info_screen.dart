import 'package:app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key, required this.success, required this.message});

  final bool success;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: primaryColor),
                  width: 100,
                  height: 100,
                  child: Center(
                    child: success
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 75,
                          )
                        : const Text(
                            "!",
                            style: TextStyle(color: Colors.white, fontSize: 75),
                          ),
                  ),
                ),
                Text(
                  success ? "Congrats!" : "Error!",
                  style: const TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 55),
                ),
                SizedBox(height: 30),
                Text(
                  message,
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
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
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: const Text(
                    "Go Back",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
