import 'package:belo_challenge/ui/screens/home_screen/widgets/myCoins.dart';
import 'package:belo_challenge/ui/screens/home_screen/widgets/see_all_coins.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';

class CoinsInformation extends StatefulWidget {
  const CoinsInformation({
    Key key,
  }) : super(key: key);

  @override
  _CoinsInformationState createState() => _CoinsInformationState();
}

class _CoinsInformationState extends State<CoinsInformation> {
  bool myCoinsIsActive = true;
  bool seeAllCoinsIsActive = false;

  Widget coinsInformationScreen() {
    if (myCoinsIsActive) {
      return MyCoins();
    } else {
      return SeeAllCoins();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          Row(
            children: [
              TextButton(
                  autofocus: myCoinsIsActive,
                  onPressed: () {
                    setState(() {
                      if (seeAllCoinsIsActive) {
                        myCoinsIsActive = true;
                        seeAllCoinsIsActive = false;
                      }
                    });
                  },
                  child: Text("Mis monedas")),
              Spacer(),
              TextButton(
                  autofocus: seeAllCoinsIsActive,
                  onPressed: () {
                    setState(() {
                      if (myCoinsIsActive) {
                        myCoinsIsActive = false;
                        seeAllCoinsIsActive = true;
                      }
                    });
                  },
                  child: Text("Ver Todas"))
            ],
          ),
          SingleChildScrollView(
            child: coinsInformationScreen(),
          )
        ],
      ),
    );
  }
}
