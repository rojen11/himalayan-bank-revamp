import 'package:app/features/transactions/presentation/widgets/send_money_card.dart';
import 'package:app/features/transfer/presentation/screens/transfer_screen.dart';
import 'package:flutter/material.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => TransferScreen()));
                },
                child: const SendMoneyCard(
                    icon: Icons.workspaces_outlined,
                    title: "Himalayan Bank",
                    description:
                        "Transfer funds to other accounts within Himalayan Bank."),
              ),
              const SizedBox(
                height: 10,
              ),
              const SendMoneyCard(
                  icon: Icons.people_outline,
                  title: "Other Bank",
                  description:
                      "Transfer funds to other accounts in other banks."),
            ],
          )),
    );
  }
}
