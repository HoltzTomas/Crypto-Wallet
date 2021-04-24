import 'package:belo_challenge/ui/screens/deposit_screen/deposit_screen.dart';
import 'package:belo_challenge/ui/screens/send_screen/send_screen.dart';
import 'package:belo_challenge/ui/screens/swap_screen/widgets/exchange_screen.dart';
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
  bool isSendActive = true, isDepositActive = false, isExchangeActive = false;

  Widget selectScreen() {
    if (isSendActive) {
      return SendScreen();
    } else if (isDepositActive) {
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
                  heroTag: "Send Button",
                  mini: true,
                  backgroundColor: kAccentColor.withOpacity(0.8),
                  child: Icon(FeatherIcons.arrowUpRight),
                  onPressed: () {
                    setState(() {
                      isSendActive = true;
                      isDepositActive = false;
                      isExchangeActive = false;
                    });
                  },
                ),
                Text("Send")
              ],
            ),
            Column(
              children: [
                FloatingActionButton(
                  heroTag: "Deposit Button",
                  mini: true,
                  backgroundColor: kAccentColor.withOpacity(0.8),
                  child: Icon(FeatherIcons.plusCircle),
                  onPressed: () {
                    setState(() {
                      isSendActive = false;
                      isDepositActive = true;
                      isExchangeActive = false;
                    });
                  },
                ),
                Text("Deposit")
              ],
            ),
            Column(
              children: [
                FloatingActionButton(
                  heroTag: "Exchange Button",
                  mini: true,
                  backgroundColor: kAccentColor.withOpacity(0.8),
                  child: Icon(FeatherIcons.repeat),
                  onPressed: () {
                    setState(() {
                      isSendActive = false;
                      isDepositActive = false;
                      isExchangeActive = true;
                    });
                  },
                ),
                Text("Exchange"),
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
