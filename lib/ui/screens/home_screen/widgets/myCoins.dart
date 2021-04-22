import 'package:belo_challenge/models/Coin.dart';
import 'package:flutter/material.dart';

import 'my_coins_list_tile.dart';

class MyCoins extends StatelessWidget {
  const MyCoins({Key key}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MyCoinListTile(coin: Coin(name: "Bitcoin",abreviation: "BTC", price: 57000, howMuchUserOwns: 1.3)),
          MyCoinListTile(coin: Coin(name: "Etherum",abreviation: "ETH", price: 13000, howMuchUserOwns: 13.7)),
        ],
      ),
    );
  }
}

