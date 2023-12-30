import 'package:app/core/utils/constants.dart';
import 'package:app/features/account/data/repositories/account_repository.dart';
import 'package:app/features/authentication/presentation/providers/auth_provider.dart';
import 'package:app/features/authentication/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountBalance extends StatelessWidget {
  const AccountBalance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Current Balance",
          textAlign: TextAlign.start,
          style: TextStyle(
              color: textColor, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        FutureBuilder(
            future: AccountRepository.getBalance(
                Provider.of<AuthProvider>(context).accessToken),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data?.success == false) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                }

                return Text(
                  "Rs. ${snapshot.data?.data}",
                  style: const TextStyle(
                      color: primaryColor,
                      fontSize: 35,
                      fontWeight: FontWeight.w800),
                );
              }
              return const CircularProgressIndicator(
                color: primaryColor,
              );
            }),
      ],
    );
  }
}
