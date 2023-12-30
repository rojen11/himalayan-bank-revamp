import 'package:app/core/utils/constants.dart';
import 'package:app/features/account/presentation/widgets/account_balance.dart';
import 'package:app/features/transfer/presentation/widgets/transfer_money_form.dart';
import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Send Money",
          style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 30, left: 30, top: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AccountBalance(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Please, enter the receiver’s bank account number in below field.",
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                SizedBox(
                  height: 30,
                ),
                TransferMoneyForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
