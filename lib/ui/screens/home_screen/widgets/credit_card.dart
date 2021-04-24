import 'package:belo_challenge/providers/user_current_money.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../../../constants.dart';

class CreditCard extends StatelessWidget {
  final avaibleMoney = Container(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(Icons.attach_money, color: kSecondaryColor),
          Consumer(
            builder: (context, watch, child) {
              return Text(
                watch(currentMoneyProvider).state.toString(),
                style: TextStyle(
                    color: kSecondaryColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 35),
              );
            },
          )
        ],
      ),
      SizedBox(
        height: 5.0,
      ),
      Text("Dinero disponible en moneda local",
          style: TextStyle(
            color: kSecondaryColor,
            fontWeight: FontWeight.normal,
          ))
    ],
  ));

  final userName = Container(
    alignment: Alignment.centerLeft,
    child: Text(
      "Satoshi Nakamoto",
      style: TextStyle(color: kSecondaryColor, fontStyle: FontStyle.italic),
    ),
  );

  final bitcoinSvg = Container(
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(bottom: kDefaultPadding),
      child: WebsafeSvg.asset("assets/icons/btc.svg", color: Colors.black));

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding),
      width: MediaQuery.of(context).size.height,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: <Color>[kPrimaryColor, kAccentColor]),
          borderRadius: BorderRadius.circular(30.0)),
      child: Column(
        children: [
          Row(
            children: [avaibleMoney, Spacer(), bitcoinSvg],
          ),
          Spacer(),
          userName
        ],
      ),
    );
  }
}
