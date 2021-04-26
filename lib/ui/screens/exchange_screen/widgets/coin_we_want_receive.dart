import 'package:belo_challenge/ui/screens/exchange_screen/widgets/select_coin_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants.dart';
import '../exchange_screen.dart';

class CoinWeWantReceive extends StatelessWidget {
  const CoinWeWantReceive({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Consumer(
                  builder: (context, watch, child) {
                    return Container(
                        child: Text(
                            watch(howMuchReceive).state.toStringAsFixed(8)));
                  },
                ),
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              //Coin Image
              Expanded(
                  flex: 1,
                  child: Consumer(
                    builder: (context, watch, child) {
                      if (watch(coinToReceiveSelected).state == null) {
                        return Text("Seleccionar moneda");
                      } else {
                        return Container(
                          child: Image.network(
                              watch(coinToReceiveSelected).state.imageUrl),
                        );
                      }
                    },
                  )),
            ],
          ),
        ),
        SizedBox(height: kDefaultPadding),
        //Select a coin Button
        TextButton(
          child: Text("Seleccionar moneda",
              textAlign: TextAlign.center,
              style: TextStyle(color: kAccentColor)),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryColor),
          ),
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (builder) {
                  return SelectCoinBottomSheet(
                    coinSelectedProvider: coinToReceiveSelected,
                  );
                });
          },
        ),
      ],
    );
  }
}

