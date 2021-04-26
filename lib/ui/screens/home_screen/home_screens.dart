import 'package:belo_challenge/constants.dart';
import 'package:belo_challenge/ui/screens/home_screen/widgets/coins_information.dart';
import 'package:belo_challenge/ui/screens/home_screen/widgets/credit_card.dart';
import 'package:belo_challenge/ui/widgets/screen_title.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: kDefaultPadding * 1.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding * 2),
                child: Row(
                  children: [
                    ScreenTitle(title: "Balance"),
                    Spacer(),
                  ],
                ),
              ),
              CreditCard(),
              SizedBox(height: kDefaultPadding,),
              CoinsInformation()
            ],
          ),
        ),
      ),
    );
  }
}

