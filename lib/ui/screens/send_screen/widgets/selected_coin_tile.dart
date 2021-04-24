import 'package:belo_challenge/models/Coin.dart';
import 'package:belo_challenge/ui/screens/send_screen/send_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants.dart';

class SelectedCoinTile extends StatelessWidget {
  const SelectedCoinTile({
    Key key,
    @required this.coin,
  }) : super(key: key);

  final Coin coin;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Image
        Container(
          padding: EdgeInsets.all(10.0),
          height: 60,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.network(coin.imageUrl, fit: BoxFit.cover),
          ),
          decoration: BoxDecoration(
              color: kAccentColor, borderRadius: BorderRadius.circular(15)),
        ),
        SizedBox(width: kDefaultPadding),
        //CoinName
        Container(
          child: Text("${coin.name[0].toUpperCase()}${coin.name.substring(1)}",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Spacer(),
        //How many coins
        Container(
            child: TextButton(
                child: Text("Select",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: kAccentColor)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  context.read(coinSelected).state = coin;
                  Navigator.pop(context);
                })),
      ],
    );
  }
}
