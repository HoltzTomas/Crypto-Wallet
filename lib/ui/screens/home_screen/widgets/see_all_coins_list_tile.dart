import 'package:belo_challenge/models/Coin.dart';
import 'package:flutter/material.dart';
 
import '../../../../constants.dart';

class SeeAllCoinsListTile extends StatelessWidget {
  final Coin coin;

  const SeeAllCoinsListTile({Key key, @required this.coin}) : super(key: key);

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
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(15)),
          ),
          SizedBox(width: kDefaultPadding),
          //CoinName
          Container(
            child: Text(
                "${coin.name[0].toUpperCase()}${coin.name.substring(1)}",
                overflow: TextOverflow.fade,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Spacer(),
          //How many coins
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("ARS ${coin.price}",
                overflow: TextOverflow.fade,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("%${coin.dayPriceVariety.toStringAsFixed(2)}",
                overflow: TextOverflow.fade,
                    style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
