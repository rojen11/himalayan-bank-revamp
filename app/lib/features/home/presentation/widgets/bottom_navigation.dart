import 'package:app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  Function(int) changeScreen;
  int currentIndex;

  BottomNavigation(
      {super.key, required this.changeScreen, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(500)),
          child: BottomAppBar(
            color: Colors.white,
            elevation: 5,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      color: currentIndex == 0 ? primaryColor : Colors.black,
                    ),
                    onPressed: () {
                      changeScreen(0);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.wallet,
                      color: currentIndex == 1 ? primaryColor : Colors.black,
                    ),
                    onPressed: () {
                      changeScreen(1);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.money,
                      color: currentIndex == 2 ? primaryColor : Colors.black,
                    ),
                    onPressed: () {
                      changeScreen(2);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
