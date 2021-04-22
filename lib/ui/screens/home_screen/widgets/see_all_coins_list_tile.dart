import 'package:belo_challenge/models/Coin.dart';
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

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
              child: WebsafeSvg.asset("assets/icons/btc.svg",
                  fit: BoxFit.cover, color: kSecondaryColor),
            ),
            decoration: BoxDecoration(
                color: Colors.blue[600], borderRadius: BorderRadius.circular(15)),
          ),
          SizedBox(width: kDefaultPadding),
          //CoinName
          Container(
            child: Text(coin.name, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Spacer(),
          //How many coins
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("USD ${coin.price}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("%${coin.dayPriceVariety}", style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
