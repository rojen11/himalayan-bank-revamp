import 'package:app/core/utils/constants.dart';
import 'package:app/features/account/presentation/widgets/account_balance.dart';
import 'package:app/features/authentication/presentation/providers/auth_provider.dart';
import 'package:app/features/transfer/data/repositories/transfer_repository.dart';
import 'package:app/features/transfer/presentation/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransferConfirmScreen extends StatelessWidget {
  const TransferConfirmScreen(
      {super.key,
      required String this.accountName,
      required String this.accountNumber,
      required double this.amount,
      required String this.remarks});

  final String accountName;
  final String accountNumber;
  final double amount;
  final String remarks;

  handleSubmit(BuildContext context) async {
    var res = await TransferRepository.transfer(
        Provider.of<AuthProvider>(context, listen: false).accessToken,
        accountName,
        accountNumber,
        amount,
        remarks);
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (builder) => InfoScreen(
                  success: res.success,
                  message:
                      res.success ? "" : res.error ?? "Something went wrong!")),
          (route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Confirm Payment",
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
                const AccountBalance(),
                const SizedBox(
                  height: 100,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Account Name",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(accountName,
                            style: const TextStyle(fontWeight: FontWeight.w500))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Account Number",
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        Text(accountNumber,
                            style: TextStyle(fontWeight: FontWeight.w500))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Amount",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text('$amount',
                            style: TextStyle(fontWeight: FontWeight.w500))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Remarks",
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        Text(remarks,
                            style: const TextStyle(fontWeight: FontWeight.w500))
                      ],
                    ),
                    SizedBox(
                      height: 100,
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
                      onPressed: () => handleSubmit(context),
                      child: const Text(
                        "Confirm",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
