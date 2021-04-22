import 'package:belo_challenge/constants.dart';
import 'package:belo_challenge/ui/screens/bottom_navigator_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0
        ),
        primarySwatch: Colors.blue,
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
        scaffoldBackgroundColor: kSecondaryColor
      ),
      home: BottomNavigatorBar(),
    );
  }
}
