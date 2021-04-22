import 'package:belo_challenge/models/Coin.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';

class MyCoinListTile extends StatelessWidget {
  const MyCoinListTile({
    Key key,
    @required this.coin,
  }) : super(key: key);

  final Coin coin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding),
      child: Row(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                    "ARS ${(coin.howMuchUserOwns * coin.price).toStringAsFixed(2)}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("${coin.howMuchUserOwns} ${coin.abreviation}",
                    style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
