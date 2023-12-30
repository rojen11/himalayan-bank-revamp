import 'package:app/features/account/presentation/widgets/account_balance.dart';
import 'package:app/features/account/presentation/widgets/account_info.dart';
import 'package:app/features/transactions/presentation/widgets/transactions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AccountBalance(),
              SizedBox(
                height: 20,
              ),
              AccountInfo(),
              SizedBox(
                height: 30,
              ),
              Transactions()
            ],
          ),
        ),
      ),
    );
  }
}
