import 'package:app/core/utils/constants.dart';
import 'package:app/features/account/data/repositories/account_repository.dart';
import 'package:app/features/authentication/presentation/providers/auth_provider.dart';
import 'package:app/features/authentication/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(
            future: AccountRepository.getAccount(
                Provider.of<AuthProvider>(context).accessToken),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data?.success == false) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }

                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Account Name",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Text(snapshot.data?.data?.accountName ?? "",
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Account Number",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Text(
                          snapshot.data?.data?.accountNumber ?? "",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ],
                );
              }
              return const CircularProgressIndicator(
                color: primaryColor,
              );
            }),
      ),
    );
  }
}
