import 'package:app/core/utils/constants.dart';
import 'package:app/features/home/presentation/screens/home_screen.dart';
import 'package:app/features/home/presentation/screens/payments_screen.dart';
import 'package:app/features/home/presentation/screens/send_money_screen.dart';
import 'package:app/features/home/presentation/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class ScreenWrapper extends StatefulWidget {
  const ScreenWrapper({super.key});

  @override
  State<ScreenWrapper> createState() => _ScreenWrapperState();
}

class _ScreenWrapperState extends State<ScreenWrapper> {
  int currentIndex = 0;

  changeScreen(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> screens = [
    HomeScreen(),
    PaymentScreen(),
    SendMoneyScreen()
  ];

  final List<String> titles = ["Himalayan Bank", "Payments", "Send Money"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              titles[currentIndex],
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: primaryColor, fontWeight: FontWeight.w700),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(20),
            child: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.notifications)),
            )
          ],
        ),
        extendBody: true,
        bottomNavigationBar: BottomNavigation(
          currentIndex: currentIndex,
          changeScreen: changeScreen,
        ),
        body: screens[currentIndex]);
  }
}
