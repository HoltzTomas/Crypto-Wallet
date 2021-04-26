import 'package:belo_challenge/providers/user_current_money.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants.dart';

class DepositScreen extends StatefulWidget {
  @override
  _DepositScreenState createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  TextEditingController _moneyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          child: TextFormField(
            controller: _moneyController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Cuanto dinero depositar (Ej: ARS 556)",
            ),
          ),
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        Container(
          child: Consumer(
            builder: (context, watch, child) {
              return TextButton(
                child: Text("Depositar Diero",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: kAccentColor)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                ),
                onPressed: () {
                  if (_moneyController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Selecciona cuanto dinero quieres depositar")));
                  } else {
                    double userMoney = double.parse(_moneyController.text);
                    double userTotalMoneyAfterDeposit =
                        userMoney + watch(currentMoneyProvider).state;
                    showDialog(
                        context: context,
                        builder: (builder) {
                          return AlertDialog(
                            title: Text(
                                "¿Seguro quieres depositar ARS ${_moneyController.text} a tu cuenta?"),
                            content: Text(
                                "Total despues del deposito: ARS $userTotalMoneyAfterDeposit"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    watch(currentMoneyProvider).state =
                                        userTotalMoneyAfterDeposit;
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Se depositaron Ars ${_moneyController.text}. Total actual Ars $userTotalMoneyAfterDeposit")));
                                  },
                                  child: Text("Si",
                                      style: TextStyle(color: kAccentColor))),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("No",
                                      style: TextStyle(color: kAccentColor)))
                            ],
                          );
                        });
                  }
                },
              );
            },
          ),
        )
      ],
    );
  }
}
