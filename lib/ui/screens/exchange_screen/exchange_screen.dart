import 'package:belo_challenge/models/Coin.dart';
import 'package:belo_challenge/ui/screens/send_screen/widgets/select_coin_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants.dart';

final coinToPaySelected = StateProvider<Coin>((ref) => null);
final coinToReceiveSelected = StateProvider<Coin>((ref) => null);
final howMuchPaid = StateProvider<double>((ref) => null);
final howMuchReceive = StateProvider<double>((ref) {
  if (ref.watch(coinToPaySelected).state == null ||
      ref.watch(coinToReceiveSelected).state == null ||
      ref.watch(howMuchPaid) == null) {
    return 0.00;
  } else {
    double coinToPay =
        double.parse(ref.watch(coinToPaySelected).state.price.toString());
    double coinToReceive =
        double.parse(ref.watch(coinToReceiveSelected).state.price.toString());
    return ((coinToPay / coinToReceive) * ref.watch(howMuchPaid).state);
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
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Consumer(
                  builder: (context, watch, child) {
                    return Container(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Envias: (Ej: BTC 35.1)",
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            watch(howMuchPaid).state = double.parse(value);
                            watch(howMuchReceive).state;
                          } else {
                            watch(howMuchPaid).state = 0.00;
                            watch(howMuchReceive).state;
                          }
                        },
                      ),
                    );
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
                      if (watch(coinToPaySelected).state == null) {
                        return Text("Seleccionar moneda");
                      } else {
                        return Container(
                          child: Image.network(
                              watch(coinToPaySelected).state.imageUrl),
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
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (builder) {
                  return SelectCoinBottomSheet(
                    coinSelectedProvider: coinToPaySelected,
                  );
                });
          },
        ),
        SizedBox(height: kDefaultPadding),
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Divider(
            thickness: 2.0,
            color: kDarkColor,
          ),
        ),
        SizedBox(height: kDefaultPadding),
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
                            watch(howMuchReceive).state.toStringAsFixed(2)));
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
            backgroundColor: MaterialStateProperty.all(Colors.black),
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
        SizedBox(height: kDefaultPadding),
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Divider(
            thickness: 2.0,
            color: kDarkColor,
          ),
        ),
        SizedBox(height: kDefaultPadding),
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (builder) {
                  return AlertDialog(
                    title: Text("Seguro quieres depositar ARS  a tu cuenta?"),
                    content: Text("Total despues del deposito ARS "),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
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
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        )
      ],
    );
  }
}
