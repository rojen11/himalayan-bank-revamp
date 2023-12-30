import 'package:app/features/account/presentation/widgets/account_balance.dart';
import 'package:app/features/home/presentation/widgets/payment_card.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AccountBalance(),
              SizedBox(
                height: 20,
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: const [
                  PaymentCard(name: "Electricity", icon: Icons.electric_bolt),
                  PaymentCard(name: "E-Commerce", icon: Icons.shopping_cart),
                  PaymentCard(name: "Mobile & Data", icon: Icons.phone_android),
                  PaymentCard(
                      name: "Transportation", icon: Icons.emoji_transportation),
                  PaymentCard(name: "TV & Internet", icon: Icons.wifi),
                  PaymentCard(name: "Pharmacy", icon: Icons.healing),
                  PaymentCard(name: "Tickets", icon: Icons.airplane_ticket),
                  PaymentCard(name: "Hotel", icon: Icons.hotel),
                  PaymentCard(name: "Flight", icon: Icons.airplanemode_active),
                  PaymentCard(name: "Fuel", icon: Icons.local_gas_station),
                  PaymentCard(name: "Water", icon: Icons.water_drop_sharp),
                  PaymentCard(name: "Education Fee", icon: Icons.school),
                  PaymentCard(name: "Movies", icon: Icons.movie_sharp),
                ],
              ),
            ],
          )),
    );
  }
}
