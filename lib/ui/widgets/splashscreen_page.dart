import 'package:belo_challenge/constants.dart';
import 'package:belo_challenge/ui/screens/bottom_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      backgroundColor: kSecondaryColor,
      image: Image.asset('assets/icons/icon.png'),
      photoSize: MediaQuery.of(context).size.height * 0.1,
      useLoader: true,
      loaderColor: kAccentColor,
      loadingText: Text("By Tomas Holtz", style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)),
      navigateAfterSeconds: BottomNavigatorBar(),
    );
  }
}