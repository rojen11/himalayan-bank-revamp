import 'package:app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class AccountBalance extends StatelessWidget {
  const AccountBalance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Current Balance",
          textAlign: TextAlign.start,
          style: TextStyle(
              color: textColor, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Text(
          "Rs. 2,85,856.20",
          style: TextStyle(
              color: primaryColor, fontSize: 35, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
