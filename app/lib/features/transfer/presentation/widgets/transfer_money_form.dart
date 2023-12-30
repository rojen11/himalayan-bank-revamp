import 'package:app/core/utils/constants.dart';
import 'package:app/features/authentication/presentation/providers/auth_provider.dart';
import 'package:app/features/transfer/data/repositories/transfer_repository.dart';
import 'package:app/features/transfer/presentation/screens/info_screen.dart';
import 'package:app/features/transfer/presentation/screens/transfer_confirm_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransferMoneyForm extends StatefulWidget {
  const TransferMoneyForm({super.key});

  @override
  State<TransferMoneyForm> createState() => _TransferMoneyFormState();
}

class _TransferMoneyFormState extends State<TransferMoneyForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController remarksController = TextEditingController();

  bool loading = false;

  void handleSubmit(BuildContext context) async {
    setState(() {
      loading = true;
    });
    var res = await TransferRepository.checkTransfer(
        Provider.of<AuthProvider>(context, listen: false).accessToken,
        nameController.value.text,
        numberController.value.text,
        double.parse(amountController.value.text));

    if (res.success) {
      if (context.mounted) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TransferConfirmScreen(
                accountName: nameController.value.text,
                accountNumber: numberController.value.text,
                amount: double.parse(amountController.value.text),
                remarks: remarksController.value.text)));
      }
    } else {
      if (context.mounted) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (builder) =>
                InfoScreen(success: false, message: res.error ?? "")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              label: Text(
                "Account Name",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
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
            controller: numberController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text(
                "Account Number",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
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
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text(
                "Enter Amount (NPR)",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
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
            controller: remarksController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text(
                "Remarks",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
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
          SizedBox(
            height: 30,
          ),
          Center(
            child: loading
                ? CircularProgressIndicator(
                    color: primaryColor,
                  )
                : ElevatedButton(
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
                      "Check transfer",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
