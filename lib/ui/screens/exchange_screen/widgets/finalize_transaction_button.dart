import 'package:belo_challenge/models/Coin.dart';
import 'package:belo_challenge/providers/user_coins.dart';
import 'package:belo_challenge/providers/user_current_money.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:belo_challenge/ui/screens/exchange_screen/exchange_screen.dart';

import '../../../../constants.dart';

class FinalizeTransactionButton extends StatelessWidget {
  const FinalizeTransactionButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return InkWell(
          onTap: () {
            if (watch(validateTransaction).state == false) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text("Selecciona una moneda y la cantidad de Ars")));
            } else if (watch(currentMoneyProvider).state < watch(howMuchArsSelected).state){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text("No tienes suficiente dinero, deposita mas.")));
            } else {
              showDialog(
                  context: context,
                  builder: (builder) {
                    return AlertDialog(
                      title: Text(
                          "Seguro quieres comprar ${watch(coinToReceiveSelected).state.abreviation.toUpperCase()} por ${watch(howMuchArsSelected).state}"),
                      content: Text(
                          "Son ${watch(howMuchReceive).state.toStringAsFixed(8)}"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              context.read(userCoinsList).state.add(Coin(
                                  name: watch(coinToReceiveSelected)
                                      .state
                                      .name,
                                  abreviation: watch(coinToReceiveSelected)
                                      .state
                                      .abreviation,
                                  price: watch(coinToReceiveSelected)
                                      .state
                                      .price,
                                  imageUrl: watch(coinToReceiveSelected)
                                      .state
                                      .imageUrl,
                                  dayPriceVariety:
                                      watch(coinToReceiveSelected)
                                          .state
                                          .dayPriceVariety,
                                  howMuchUserOwns:
                                      watch(howMuchReceive).state));
                              watch(currentMoneyProvider).state =
                                  watch(currentMoneyProvider).state -
                                      watch(howMuchArsSelected).state;
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Compraste ${watch(coinToReceiveSelected).state.abreviation.toUpperCase()}")));
                            },
                            child: Text("Si")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("No"))
                      ],
                    );
                  });
            }
          },
          child: Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: kAccentColor,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Center(
                child: Text(
              "Finalizar transaccion",
              style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
            )),
          ),
        );
      },
    );
  }
}

