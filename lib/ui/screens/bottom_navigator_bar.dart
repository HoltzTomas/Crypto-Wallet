import 'package:belo_challenge/constants.dart';
import 'package:belo_challenge/ui/screens/home_screen/home_screens.dart';
import 'package:belo_challenge/ui/screens/swap_screen/swap_screen.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class BottomNavigatorBar extends StatefulWidget {
  @override
  _BottomNavigatorBarState createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int indexTap = 0;

  final List<Widget> widgetsChildren = [HomeScreen(), SwapScreen()];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: kSecondaryColor,
          primaryColor: kPrimaryColor,
        ),
        child: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: onTapTapped,
            currentIndex: indexTap,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.creditCard), label: "Balance"),
              BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.repeat), label: "Swap"),
            ]),
      ),
    );
  }
}
