import 'package:belo_challenge/models/Coin.dart';
import 'package:belo_challenge/ui/screens/exchange_screen/widgets/coin_we_want_receive.dart';
import 'package:belo_challenge/ui/screens/exchange_screen/widgets/finalize_transaction_button.dart';
import 'package:belo_challenge/ui/screens/exchange_screen/widgets/how_much_ars_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants.dart';

final howMuchArsSelected = StateProvider<double>((ref) => null);
final validateTransaction = StateProvider<bool>((ref) {
  if (ref.watch(howMuchArsSelected).state == null) {
    return false;
  } else if (ref.watch(coinToReceiveSelected).state == null) {
    return false;
  } else {
    return true;
  }
});
final coinToReceiveSelected = StateProvider<Coin>((ref) => null);
final howMuchReceive = StateProvider<double>((ref) {
  if (ref.watch(coinToReceiveSelected).state == null) {
    return 0.00;
  } else {
    return (ref.watch(howMuchArsSelected).state /
        ref.watch(coinToReceiveSelected).state.price);
  }
});

class ExchangeScreen extends StatefulWidget {
  @override
  _ExchangeScreenState createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HowMuchArsTextField(),
        SizedBox(height: kDefaultPadding * 2),
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Divider(
            thickness: 2.0,
            color: kDarkColor,
          ),
        ),
        SizedBox(height: kDefaultPadding),
        CoinWeWantReceive(),
        SizedBox(height: kDefaultPadding),
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Divider(
            thickness: 2.0,
            color: kDarkColor,
          ),
        ),
        SizedBox(height: kDefaultPadding),
        FinalizeTransactionButton()
      ],
    );
  }
}

