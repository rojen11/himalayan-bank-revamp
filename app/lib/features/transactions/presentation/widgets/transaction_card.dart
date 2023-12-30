import 'package:app/core/utils/constants.dart';
import 'package:app/features/transactions/domain/entities/transaction_entity.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  TransactionEntity transaction;

  TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: primaryColor,
      elevation: 1,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.transaction.destinationAccount.accountName,
                  style: const TextStyle(
                      color: primaryColor, fontWeight: FontWeight.w600),
                ),
                Text(
                  this.transaction.destinationAccount.accountNumber,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  this.transaction.transactionDate.toString(),
                  style: const TextStyle(
                      color: textColor, fontWeight: FontWeight.w500),
                )
              ],
            ),
            Text(
              '${this.transaction.debited ? "-" : "+"} Rs. ${transaction.amount}',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: this.transaction.debited
                      ? Colors.red.shade900
                      : Colors.green.shade900),
            )
          ],
        ),
      ),
    );
  }
}
