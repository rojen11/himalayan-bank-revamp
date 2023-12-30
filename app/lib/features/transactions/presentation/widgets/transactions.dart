import 'package:app/core/utils/constants.dart';
import 'package:app/features/authentication/presentation/providers/auth_provider.dart';
import 'package:app/features/authentication/presentation/screens/login_screen.dart';
import 'package:app/features/transactions/data/repositories/transaction_repository.dart';
import 'package:app/features/transactions/presentation/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recent Transactions",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: textColor),
        ),
        FutureBuilder(
            future: TransactionRepository.getTransactions(
                Provider.of<AuthProvider>(context).accessToken),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data?.success == false) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }
                return Column(
                    children: snapshot.data?.data!
                            .map((e) => TransactionCard(transaction: e))
                            .toList() ??
                        []);
              }
              return const CircularProgressIndicator(
                color: primaryColor,
              );
            }),
      ],
    );
  }
}
