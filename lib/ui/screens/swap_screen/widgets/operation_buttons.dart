import 'package:belo_challenge/ui/screens/deposit_screen/deposit_screen.dart';
import 'package:belo_challenge/ui/screens/exchange_screen/exchange_screen.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class OperationButtons extends StatefulWidget {
  const OperationButtons({
    Key key,
  }) : super(key: key);

  @override
  _OperationButtonsState createState() => _OperationButtonsState();
}

class _OperationButtonsState extends State<OperationButtons> {
  bool isDepositActive = true, isExchangeActive = false;

  Widget selectScreen() {
    if (isDepositActive) {
      return DepositScreen();
    } else {
      return ExchangeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                FloatingActionButton(
                  heroTag: "Deposit Button",
                  mini: true,
                  backgroundColor: kAccentColor.withOpacity(0.8),
                  child: Icon(FeatherIcons.plusCircle, color: kPrimaryColor),
                  onPressed: () {
                    setState(() {
                      isDepositActive = true;
                      isExchangeActive = false;
                    });
                  },
                ),
                Text(isDepositActive ? "Depositar" : "")
              ],
            ),
            Column(
              children: [
                FloatingActionButton(
                  heroTag: "Exchange Button",
                  mini: true,
                  backgroundColor: kAccentColor.withOpacity(0.8),
                  child: Icon(FeatherIcons.repeat, color: kPrimaryColor),
                  onPressed: () {
                    setState(() {
                      isDepositActive = false;
                      isExchangeActive = true;
                    });
                  },
                ),
                Text(isExchangeActive ? "Exchange" : ""),
              ],
            ),
          ],
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        Container(
          child: selectScreen(),
        )
      ],
    );
  }
}
